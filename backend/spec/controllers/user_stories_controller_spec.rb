require_relative '../rails_helper'

RSpec.describe UserStoriesController, type: :controller do
  let(:persona) {'Alex'}
  let(:goal) {'create a user story'}
  let(:reason) {'I can have a discussion with the team'}

  let(:user_story) do
    {
        persona: persona,
        goal: goal,
        reason: reason
    }
  end

  describe 'POST /api/user_stories' do
    it 'stores a created user story' do
      post(:create, params: user_story)

      created = UserStory.last

      expect(created.id).to be > 0
      expect(created.persona).to eq(persona)
      expect(created.goal).to eq(goal)
      expect(created.reason).to eq(reason)
    end

    it 'stores only one user story' do
      post(:create, params: user_story)

      all = UserStory.all

      expect(all.size).to eq(1)
    end

    it 'returns a created user story with status created' do
      post(:create, params: user_story)

      created = UserStory.last

      expect(response).to be_created
      expect(response.body).to eq(created.to_json)
    end

    describe 'integration', type: :racktest do
      it 'creates a user story' do
        post_json('/api/user_stories', user_story)

        created = UserStory.last

        expect(last_response).to be_created
        expect(last_response.body).to eq(created.to_json)
      end
    end
  end

  describe 'GET /api/user_stories/:id' do
    let!(:created) {UserStory.create(user_story)}

    it 'fetches an existing user story' do
      get(:show, params: {id: created.id})

      expect(response).to be_ok
      expect(response.body).to eq(created.to_json)
    end

    describe 'integration', type: :racktest do
      it 'fetches an existing user story' do
        get("/api/user_stories/#{created.id}")

        expect(last_response).to be_ok
        expect(last_response.body).to eq(created.to_json)
      end
    end
  end
end