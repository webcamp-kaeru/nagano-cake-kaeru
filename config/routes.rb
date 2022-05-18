Rails.application.routes.draw do

  namespace :admin do
    get 'order_products/update'
  end
  namespace :admin do
    get 'orders/show'
    get 'orders/update'
  end
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
   root to: 'homes#top'
   resources :products, only:[:index, :show, :new, :edit, :create, :update]
   resources :genres, only:[:index, :edit, :create, :update]
   resources :members, only:[:index, :show, :edit, :update]
   resources :orders, only:[:show, :update] do
     resources :order_products, only:[:update]
   end
  end

end
