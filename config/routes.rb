Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/employee/new'
  put '/employee/update_status'
  post '/expense/new_expense'
  get '/admin/search/:id', to: 'expense#search'
  post '/comments/new', to: 'comments#new'
  post '/expense/admin_expense_action'

end
