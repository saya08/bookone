Rails.application.routes.draw do
  # get 'books/:id' => 'books#show'

  # get 'books/edit'
  	root 'start#top'
	resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
