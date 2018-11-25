Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
     resources :pub_sub do
     	collection do
     		get 'subscribe'
     		get 'publish'
     	end
     end


     resources :notify do
     	collection do
     		get 'subscribe'
     		get 'send_events'
     		get 'test'
     	end
     end



end
