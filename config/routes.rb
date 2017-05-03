Rails.application.routes.draw do

  resources :orders
  resources :menu_items
  devise_for :users
	root 'home#index'
  resources :dine_tables do
  	collection do
  		post :send_to_kitchen
  	end
  end
  get 'home/index'
  get 'home/report_by_category'
  get 'home/report_pdf'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
