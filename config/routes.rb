Rails.application.routes.draw do

  root "employees#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :employees
  resources :documents

  get '/about-us' => 'pages#about_us'
  get '/contact-us' => 'pages#contact_us'
  get '/privacy-policy' => 'pages#privacy_policy'
  get '/terms_and-conditions' => 'pages#terms_and_conditions'
end
