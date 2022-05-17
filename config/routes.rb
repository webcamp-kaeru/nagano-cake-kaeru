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
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "public/homes#top"
  get "about" => 'public/homes#about'

end
