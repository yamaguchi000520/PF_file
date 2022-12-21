Rails.application.routes.draw do

  namespace :admin do
    get 'sakes/index'
  end
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
    resources :genres, only:[:index,:create,:edit,:update,:destroy]
    resources :sakes, only:[:show,:index,:destroy]
    resources :customers, only:[:index,:show,:edit,:update]
    get "homes/about" => "homes#about"
    resources :homes, only:[:create,:edit,:update,:destroy]
  end

  scope module: :public do
    get 'search' => 'searches#search'
    get 'genre_search' => 'sakes#genre_search'
    resources :sakes, only:[:index,:show,:destroy,:edit,:update,:create] do
      resources :sake_comments, only:[:edit,:update,:destroy,:create]
      resource :favorites, only:[:create,:destroy]
      get 'search' => "genres#search"
    end
    get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/delete_status' => 'customers#is_deleted'
    resources :customers, only:[:index,:show,:destroy,:edit,:update,:create] do
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      resource :relationships, only:[:destroy,:create]
    end
    # get '/customers/my_page' => 'customers#show'
    # get '/customers' => 'customers#index'
    # get '/customers/information/edit' => 'customers#edit'
    # patch '/customers/information' => 'customers#update'
    resources :tags, only:[:create,:destroy]
  end
end
