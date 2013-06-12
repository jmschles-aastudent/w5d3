RedditClone::Application.routes.draw do
	resources :comments, :only => [:create, :show]
	resources :links
  resource :session, :only => [:new, :create, :destroy]
  resources :subs
  resources :users, :only => [:new, :create, :show]

  
end
