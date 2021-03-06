Rails.application.routes.draw do
  get 'contact_persons/new'

  root 'registrations#new'
  post 'registrations', to: 'registrations#create'
  post '/decrypt', to: 'registrations#decrypt'

  get 'registrations/:hashed_email', to: 'registrations#edit', as: 'registration'
  put 'registrations/:hashed_email', to: 'registrations#update'
  delete 'registrations/:hashed_email', to: 'registrations#delete'
  get 'registrations/:hashed_email/confirm', to: 'registrations#confirm', as: 'registration_confirm'
  get 'registrations', to: 'registrations#index'
  get 'registrations/:hashed_email/shift_confirm_yes', to: 'registrations#shift_confirm_yes', as: 'registrations_shift_confirm_yes'
  get 'registrations/:hashed_email/shift_confirm_no', to: 'registrations#shift_confirm_no', as: 'registrations_shift_confirm_no'
  get 'registrations/:hashed_email/shift_confirm_reset', to: 'registrations#shift_confirm_reset', as: 'registrations_shift_confirm_reset'

  get '/login', to: 'contact_persons#new'
  post 'login', to: 'contact_persons#create'
  get 'logout', to: 'contact_persons#delete'
  get 'contact_persons/:hashed_email/confirm', to: 'contact_persons#confirm', as: 'contact_person_confirm'
  get '/clean_browser', to: 'contact_persons#clean_browser'
  get '/contact_persons/:hashed_email/warning', to: 'contact_persons#warning', as: 'contact_person_warning'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
