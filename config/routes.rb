Rails.application.routes.draw do
  root 'site#main'

  get '/:url_string' => 'site#handle_link'
  get '/*all' => 'site#missing'
end
