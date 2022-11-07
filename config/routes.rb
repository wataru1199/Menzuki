Rails.application.routes.draw do
  
  devise_for :admins
  devise_for :members
  

  #会員側
  #URLはそのままで参照をcontroller/publicにする
  scope module: :public do
    
    root :to => "homes#top"
    get 'about' => "homes#about"
    resource :categories, only: [:index]
    resource :comments, only: [:index]
    resource :favorites, only: [:index]
    resource :members, only: [:index]
    resource :relations, only: [:index]
    resource :reviews, only: [:index]
  end


  #管理者側
  #URLにadminを追加し参照をcontroller/adminにする
  namespace :admin do

    root :to => 'homes#top'
    resource :categories, only: [:index]
    resource :comments, only: [:index]
    resource :favorites, only: [:index]
    resource :members, only: [:index]
    resource :relations, only: [:index]
    resource :reviews, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
