require 'omniauth-oauth2'
require 'base64'

module OmniAuth
  module Strategies
    class Quizlet < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = 'read'

      option :client_options, {
        :site => 'https://quizlet.com/',
        :authorize_url => 'https://quizlet.com/authorize/',
        :token_url => 'https://api.quizlet.com/oauth/token'
      }

      option :authorize_params, {
        :response_type => 'code',
        :scope => 'read',
        :state => 'some_random_string'
      }

      uid { access_token.params['user_id'] }
    end
  end
end
