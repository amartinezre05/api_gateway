Rails.application.routes.draw do
    post '/register', to: 'gateway#register'
    post '/login', to: 'gateway#login'
end
