Rails.application.routes.draw do

  get '/', to: 'site#home'
  get '/contact', to: 'site#contact'
  
  get '/calculator', to: 'site#calculator'
  post 'calculate', to: 'site#calculate'

  get '/projects', to: 'projects#index'
end
