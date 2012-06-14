Artlife::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  get "home/index"
  resources :locales, :only => :update
  devise_for :users
  resources :categories, :only => :show

  namespace :admin do
    resources :home, :only => :index
    resources :properties, :only => [:index, :update, :edit]
    resources :categories do
      resources :position, :only => [:update], :controller => "category_position"
    end
  end

  mount Ckeditor::Engine => "/ckeditor"
  root :to => 'home#index'
end
