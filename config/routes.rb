# frozen_string_literal: true

Rails.application.routes.draw do
  resources :meals
  # RESTful routes
  resources :examples, except: %i[new edit]

  # Authentication resources routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'

  # Books resources routes
  resources :books, except: %i[new edit]
  # # resources: turns the bottom into above
  # get '/books' => 'books#index'
  # get '/books/:id' => 'books#show'
  # post '/books' => 'books#create'
  # patch '/books/:id' => 'books#update'
  # delete '/books/:id' => 'books#destroy'

  # Patients resources routes
  resources :patients, except: %i[new edit]

  # Ingredients resources routes
  resources :ingredients, except: %i[new edit]

  # Authors resources routes
  resources :authors, except: %i[new edit]

  # Doctors resources routes
  resources :doctors, except: %i[new edit]

  # Recipes resources routes
  resources :recipes, except: %i[new edit]

  # Borrowers resources routes
  resources :borrowers, except: %i[new edit]

  # Loans resources routes
  resources :loans, except: %i[new edit]

  # Appointments resources routes
  resources :appointments,  except: %i[new edit]

  # Meals resources routes
  resources :meals,  except: %i[new edit]
end
