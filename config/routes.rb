Rails.application.routes.draw do
  namespace :client do
     get '/jobs' => 'jobs#index'
     get '/jobs/new' => 'jobs#new'
     post '/jobs' => 'jobs#create'
     get '/jobs/:id' => 'jobs#show'
     get '/jobs/:id/edit' => 'jobs#edit'
     patch '/jobs/:id' => 'jobs#update'
     delete '/jobs/:id' => 'jobs#destroy'

     get '/job_searches' => 'job_searches#index'

     get '/users' => 'sign_ups#index'
     get '/users/new' => 'sign_ups#new'
     post '/users' => 'sign_ups#create'

     get '/login' => 'sign_ups#login_form'
     post '/login' => 'sign_ups#login_create'
   end
end
