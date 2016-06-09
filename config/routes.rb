Rails.application.routes.draw do
  root 'site#index'
  post '/links' => 'link#create'

  get '/:url_string' => 'site#handle_link'
  get '/.well-known/acme-challenge/:id' => 'site#letsencrypt'
  get '/*all' => 'site#missing'
end
