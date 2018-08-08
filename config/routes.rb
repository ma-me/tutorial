Rails.application.routes.draw do

  root 'home#index'

  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'

  # root 'application#hello'
end
