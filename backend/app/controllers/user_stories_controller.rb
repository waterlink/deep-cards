class UserStoriesController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    user_story = UserStory.create(user_story_params)
    render json: user_story, status: 201
  end

  def show
    user_story = UserStory.find(params[:id])
    render json: user_story
  end

  def user_story_params
    params.permit(:persona, :goal, :reason)
  end
end