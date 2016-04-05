Rails.application.routes.draw do
  root 'site#main'
  post '/links' => 'link#create'

  get '/:url_string' => 'site#handle_link'
  get '/*all' => 'site#missing'
end
