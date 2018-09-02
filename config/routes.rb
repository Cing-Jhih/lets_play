Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:show, :edit, :update] do
    member do
      get :games
      get :replies
      get :favorites
    end
  end

  resources :games do
    # 隨機推薦遊戲
    collection do
      get :random
    end

    # 關鍵字搜尋遊戲
    collection do
      get :search
    end
  
    member do
      # 收藏 / 取消收藏
      post :favorite
      post :unfavorite
    end

     # 評論遊戲
     resources :replies, only: [:create, :destroy]

  end

  resources :situations, only: :show

  resources :ages, only: :show

  root "home#index"

  namespace :admin do
    resources :games, only: [:index, :edit, :update, :destroy]
    resources :users, only: [:index, :edit, :update, :destroy]
    resources :situations, only: [:index, :edit, :update, :destroy]
    resources :ages, only: [:index, :edit, :update, :destroy]
    root "games#index"
  end
  
end
