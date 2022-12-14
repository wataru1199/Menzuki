Rails.application.routes.draw do

  namespace :public do
    get 'searches/search'
  end
  get 'searches/search'
  devise_for :admins
  devise_for :members, controllers: {
  sessions: 'public/members/sessions',
  registrations: 'public/members/registrations'
}

  devise_scope :member do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end


  #会員側
  #URLはそのままで参照をcontroller/publicにする
  scope module: :public do

    root :to => "homes#top"
    get 'about' => "homes#about"

    patch 'members/:id/status' => 'members#status', as: 'status_member'
    get "search" => "searches#search"
    get 'categories/:id' => "categories#index", as: "categories"
    resources :members, only: [:show, :edit, :update] do
      member do
        get :favorites
      end
    end
    resources :reviews, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
  end


  #管理者側
  #URLにadminを追加し参照をcontroller/adminにする
  namespace :admin do

    get "search" => "reviews#search"
    delete 'reviews/destroy_select' => 'reviews#destroy_select'
    delete 'reviews/destroy_all' => 'reviews#destroy_all'
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :members, only: [:index, :new, :create, :show, :edit, :update]
    resources :reviews, only: [:index, :show, :edit, :update, :destroy] do
      resources :comments, only: [:destroy]
      resource :favorites, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
