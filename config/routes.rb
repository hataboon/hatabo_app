Rails.application.routes.draw do
  get 'sinsui/index'
  root 'top#index'
  
  get "up" => "rails/health#show", as: :rails_health_check

  get "games/start", to: "games#start", as: "start_game"
  post 'games/flip', to: 'games#flip'
end
