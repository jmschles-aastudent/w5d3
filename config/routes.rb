RedditClone::Application.routes.draw do
	resources :links
  resource :session, :only => [:new, :create, :destroy]
  resources :subs
  resources :users, :only => [:new, :create, :show]

  
end
