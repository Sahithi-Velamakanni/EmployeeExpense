Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/employee/new'
  put '/employee/update_status'
  post '/bill/new_bill'

end
