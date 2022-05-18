Rails.application.routes.draw do

  devise_for :members, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  root to: "public/homes#top"
  get "about" => 'public/homes#about'

  namespace :public do
   resources :products, only:[:index, :show]
  end

  namespace :admin do
   resources :products, only:[:index, :show, :new, :edit, :create, :update]
   resources :genres, only:[:index, :edit, :create, :update]
  end

end
