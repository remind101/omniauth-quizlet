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
      
      extra do
        raw_info
      end

      uid { raw_info['user_id'] }

      def raw_info
        access_token.options[:mode] = :header
				encoded_auth = Base64.encode64("#{options.client_id}:#{options.client_secret}").strip
        access_token.options[:header_format] = "Basic #{encoded_auth}"
        access_token.options[:param_name] = :code
        access_token.options[:headers] = {
          'grant_type' => 'authorization_code'
        }
        begin
          ops = {
            :headers => { 'grant_type'=>'authorization_code'},
            :body => { 
              'grant_type'=>'authorization_code',
              'code' => @request.params['code']
            }
          }
          @raw_info ||= access_token.post(options.client_options['token_url'],ops).parsed
        rescue Exception => e
          Rails.logger.info e.inspect
        end
      end 


    end
  end
end
