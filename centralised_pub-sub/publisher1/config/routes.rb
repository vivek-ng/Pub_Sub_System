Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

     resources :publish do
     	collection do
     		get 'notifications'
     	end
     end

end
