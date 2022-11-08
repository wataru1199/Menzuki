Rails.application.routes.draw do

  devise_for :admins
  devise_for :members


  #会員側
  #URLはそのままで参照をcontroller/publicにする
  scope module: :public do

    root :to => "homes#top"
    get 'about' => "homes#about"
    resources :categories, only: [:index, :new, :create, :edit, :update]
    resources :members, only: [:index, :new, :create, :show, :edit, :update]
    resources :relations, only: [:create, :delete]
    resources :reviews, only: [:index, :new, :create, :show, :edit, :update, :delete] do
      resources :comments, only: [:index, :new, :create, :edit, :update, :delete]
      resource :favorites, only: [:create, :delete]
    end
  end


  #管理者側
  #URLにadminを追加し参照をcontroller/adminにする
  namespace :admin do

    root :to => 'homes#top'
    resources :categories, only: [:index, :new, :create, :edit, :update]
    resources :members, only: [:index, :new, :create, :show, :edit, :update]
    resources :relations, only: [:create, :delete]
    resources :reviews, only: [:index, :new, :create, :show, :edit, :update, :delete] do
      resources :comments, only: [:index, :new, :create, :edit, :update, :delete]
      resource :favorites, only: [:create, :delete]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
