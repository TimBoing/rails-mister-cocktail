Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  resources :cocktails, only: [:index, :show, :new, :create]

end


# see list of cocktails
# / INDEX for cock
# see the details of a given cocktail, with the dose needed for each ingredient
# show for cock
