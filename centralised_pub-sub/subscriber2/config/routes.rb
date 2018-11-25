Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
    resources :notify do
     	collection do
     		get 'notify_subscribers'
     		post 'test'
     		get 'subscribe'
     	end
     end

end
