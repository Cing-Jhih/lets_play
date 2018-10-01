Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :games
      get :replies
      get :favorites
      get :messages
      get :followships
    end
    resources :messages, only: [:create, :destroy]
  end

  get '/users/:id/group', to: 'groups#index', as: 'groups_user'
  get '/groups/:level', to: 'groups#show_users', as: 'groups'

  root "games#index"
  get '/games/hashtag/:name', to:'games#hashtag', as: :hashtag

  resources :games do
    # 隨機推薦遊戲、關鍵字搜尋遊戲
    collection do
      get :random
      get :search
      get :popular
      get :latest
    end

    # 收藏 / 取消收藏
    member do
      post :favorite
      post :unfavorite
    end

     # 評論遊戲
     resources :replies, only: [:create, :destroy]
  end

  resources :situations, only: :show
  resources :ages do
    collection do
      get :baby
      get :kidergarten
      get :junior
      get :middle
      get :senior
    end
  end

  resources :followships, only: [:create, :destroy]

  namespace :admin do
    resources :games, only: [:index, :edit, :update, :destroy]
    resources :users, only: [:index, :edit, :update, :destroy]
    resources :situations, only: [:index, :edit, :update, :destroy]
    resources :ages, only: [:index, :edit, :update, :destroy]
    root "games#index"
  end

end
