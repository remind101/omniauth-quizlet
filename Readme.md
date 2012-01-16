### An omniauth strategy for [quizlet](www.quizlet.com)

config/initializers/omniauth.rb
``` ruby

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :quizlet,'your_client_id','your_client_secret'
end

```

Rails3.1 Gemfile
``` ruby

gem 'omniauth'
gem 'omniauth-oauth2'
gem 'omniauth-quizlet'

```
