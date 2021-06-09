Rails.application.routes.draw do
 root 'static_pages#top'
  get '/signup', to: 'users#new'

  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

   resources :users do
    member do
      get 'index_attendance', to: 'users#index_attendance'
      get 'edit_basic_info'
      patch 'update_basic_info'
      get 'attendances/edit_one_month'
      patch 'attendances/update_one_month' 
      get 'attendances/edit_overtime_request'
      patch 'attendances/update_overtime_request'
      get 'attendances/attendance_log'
      
    end
     collection {post :import} 
     member do
     end 
     resources :bases 
      resources :attendances
      
      resources :month_approvals
   end
end