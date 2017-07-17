Rails.application.routes.draw do
  scope :api do
    resources :user_stories,
              only: %i(create show),
              defaults: {format: :json}
  end
end
