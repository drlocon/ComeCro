Rails.application.routes.draw do
  namespace :public do
    get 'groups/new'
    get 'groups/index'
    get 'groups/show'
    get 'groups/edit'
  end
  namespace :public do
    get 'chats/show'
  end
  namespace :public do
    get 'likes/new'
    get 'likes/index'
    get 'likes/show'
    get 'likes/edit'
  end
  namespace :public do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :public do
    get 'homes/top'
  end
  namespace :admin do
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  # devise/adminサイド
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  # devise/publicサイド
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
