Artlife::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  get "home/index"
  match "/admin" => "admin/home#index"
  match "/categories" => "home#index"
  resources :locales, :only => :update
  devise_for :users
  resources :categories, :only => :show do
    resources :artists, :only => [:index, :show]
  end

  namespace :admin do
    resources :home, :only => :index
    resources :properties, :only => [:index, :update, :edit]
    resources :categories do
      resources :artists
    end
    resources :sortable do
      resources :position, :only => [:update], :controller => "sortable_position"
    end
    resources :artists do
      resources :photos, :only => [:create, :destroy]
    end
  end

  mount Ckeditor::Engine => "/ckeditor"
  root :to => 'home#index'
end
