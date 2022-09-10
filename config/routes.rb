Rails.application.routes.draw do
  # devise/adminサイド
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  # devise/publicサイド
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # publicサイド
  scope module: :public do
    root to: "homes#top"
    
    resources :users, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
  	  get 'followers' => 'relationships#followers', as: 'followers'
      get "confirm" => "users#confirm"
      patch "withdrawal" => "users#withdrawal"
      get "favorites" => "users#favorites"
    end
    
    resources :likes do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
      collection do
        get "word_search" => "likes#word_search"
        get "tag_search" => "likes#tag_search"
      end
    end
    
    resources :chats, only: [:show, :create]
    
    resources :groups, only: [:new, :index, :show, :create, :edit, :update] do
      resource :group_users, only: [:create, :destroy]
    end
  end
  
  # adminサイド
  namespace :admin do
    get "/" => "homes#top"
    
    resources :users, only: [:show, :edit, :update] do
      collection do
        get "word_search" => "users#word_search"
      end
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
