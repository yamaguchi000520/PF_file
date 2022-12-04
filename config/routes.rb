Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'public/homes#top'
  get "about" => "public/homes#about"
  get "admin" => "admin/homes#top"

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :genres, only:[:index,:create,:edit,:update]
    resources :customers, only:[:index,:show,:edit,:update]
  end

  scope module: :public do
    resources :sakes, only:[:index,:show,:destroy,:edit,:update,:create] do
      get 'search' => "genres#search"
    end
    # idは必要ないためresoure
    get '/customers/my_page' => 'customers#show'
    get '/customers/information/edit' => 'customers#edit'
    patch '/customers/information' => 'customers#update'
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/delete_status' => 'customers#is_deleted'
    resources :comments, only:[:edit,:update,:destroy,:create]
    resources :tags, only:[:create,:destroy]
    resources :relationships, only:[:index,:destroy,:create]
    resources :favorites, only:[:create,:destroy]
  end
end
