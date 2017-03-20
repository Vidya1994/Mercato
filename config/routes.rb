Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#home'


  get '/signup' => 'users#new'                                                            # Signup page
  post '/users' => 'users#create'                                                         # Signup form submission

  get '/users/edit' => 'users#edit'                                                       # Edit profile page
  patch '/users/edit' => 'users#update', as: :edit_user, format: 'json'                   # Edit profile form submission

  delete '/users/address/:address_id' => 'users#delete_address', format: 'json'           # Delete Address
  get '/users/address/' => 'users#new_address'                                            # New Address Form page
  post '/users/address' => 'users#add_address', format: 'json'                            # New Address Form submission

  delete '/users/card_detail/:card_number' => 'users#delete_card_detail', format: 'json'  # Delete Card Details
  get '/users/card_detail' => 'users#new_card_detail'                                     # New Card Detail Form page
  post '/users/card_detail' => 'users#add_card_detail', format: 'json'                    # New Card Details Form submission

  get '/login' => 'sessions#login', as: :login                                            # Get login page
  post 'login' => 'sessions#create', format: 'json'                                       # Login form submission
  delete 'logout' => 'sessions#destroy', as: :logout                                      # Logout

  get '/admin' => 'admin#login', as: :admin_login                                         # Get admin login page
  get '/admin/home' => 'admin#home', as: :admin_home                                      # Get admin home page
  get '/admin/product/all' => 'admin#all_products', as: :all_products                     # Get admin all products page
  get '/admin/product/add' => 'admin#add_product', as: :add_product_form                  # Get admin add product page
  get '/admin/product/edit' => 'admin#edit_product', as: :edit_product_form               # Get admin edit product page
  get '/admin/product/' => 'admin#product_table'                                          # Get product table [ajax]
  post '/admin/product/add' => 'admin#create_product', format: 'json'                     # Add product [ajax]
  put '/admin/product/:product_id' => 'admin#update_product', format: 'json'              # Edit Product [ajax]
  delete '/admin/product/:product_id' => 'admin#delete_product', format: 'json'           # Delete product [ajax]
end
