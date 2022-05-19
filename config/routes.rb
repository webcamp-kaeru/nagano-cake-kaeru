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
   delete "cart_products/destroy_all" => "cart_products#destroy_all"
   get "orders/thanks" => "orders#thanks"
   post "orders/confirm" => "orders#confirm"
   get "members/my_page" => "members#show"
   get "members/unsubscribe" =>"members#unsubscribe"
   get "members/my_page/edit" => "members#edit"
   patch "members/withdraw" => "members#withdraw"
   patch "members/my_page" => "members#update"
   resources :products, only:[:index, :show]
   resources :cart_products, only:[:index, :create, :update, :destroy]
   resources :orders, only:[:new, :create, :index, :show]
   resources :delivery_addresses, only:[:index, :create, :edit, :update, :destroy]
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
