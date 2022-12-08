Rails.application.routes.draw do

  root to: 'public/homes#top'
  get "about" => "public/homes#about"
  get "admin" => "admin/homes#top"

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :genres, only:[:index,:create,:edit,:update]
    resources :customers, only:[:index,:show,:edit,:update]
  end

  scope module: :public do
    resources :sakes, only:[:index,:show,:destroy,:edit,:update,:create] do
      resources :comments, only:[:edit,:update,:destroy,:create]
      get 'search' => "genres#search"
    end
    get '/customers/my_page' => 'customers#show'
    get '/customers' => 'customers#index'
    get '/customers/information/edit' => 'customers#edit'
    patch '/customers/information' => 'customers#update'
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/delete_status' => 'customers#is_deleted'
    resources :tags, only:[:create,:destroy]
    resources :relationships, only:[:index,:destroy,:create]
    resources :favorites, only:[:create,:destroy]
  end
end
