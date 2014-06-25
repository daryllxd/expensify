Expensify::Application.routes.draw do
  root 'home#index'

  namespace :api do
    namespace :v1 do
      resources :expenses
    end
  end
end
