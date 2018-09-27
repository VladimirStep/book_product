Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'books#index'

  resources :books, except: [:destroy] do
    collection do
      get 'report'
    end
  end

  namespace 'api' do
    namespace 'v1' do
      resources :books, only: [:index, :show, :create]
    end
  end
end
