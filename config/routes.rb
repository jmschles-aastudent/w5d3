RedditClone::Application.routes.draw do
	resources :links, :only => [:create, :destroy]
  resource :session, :only => [:new, :create, :destroy]
  resources :subs
  resources :users, :only => [:new, :create, :show]

  
end
