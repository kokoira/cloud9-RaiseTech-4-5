Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  #==================削除orコメントアウト================
  # get 'favorites/create'
  # get 'favorites/destroy' 
  #=====================================
  root 'tweets#index'
  devise_for :users

  # ================ここをネスト(入れ子)した形に変更
  resources :tweets do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
  end
  #======================================

  resources :users 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
