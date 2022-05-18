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

  scope module: :public do
   resources :products, only:[:index, :show]
   resources :cart_products, only:[:index, :create, :update, :destroy]
   delete "cart_products/destroy_all" => "cart_products#destroy_all"
   resources :orders, only:[:new, :create, :index, :show]
   get "orders/thanks" => "orders#thanks"
   post "orders/confirm" => "orders#confirm"
   resource:members, only:[:edit, :update]
   get "members/my_page" => "members#show"
   get "members/unsubscribe" =>"members#unsubscribe"
   patch "members/withdraw" => "members#withdraw"
   resources :delivery_address, only:[:index, :create, :edit, :update, :destroy]
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
