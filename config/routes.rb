Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  get '/product/:id' => 'home#product'

  get '/admin' => 'admin#main'
  get '/admin/products' => 'admin#products'
  get '/admin/logo' => 'admin#logo'

  put '/admin/products' => 'admin#products'

  get '/customs/load_images/logo/:id' => 'customs#load_logo'
  get '/customs/load_info' => 'customs#product_info'
  get '/customs/edit_data' => 'customs#edit_product'
  get '/custom/delete_image_control' => 'customs#delete_image'

  post '/customs/reload_table' => 'customs#table_products'

  put '/customs/edit/product' => 'customs#save_product'
  put '/customs/upload_image' => 'customs#upload_image'
  put '/customs/save_variation' => 'customs#save_variation'

  put '/add/gallery/logo' => 'galleries#create'

end
