# coding: utf-8
class Api::Sns::GoogleController < Api::Sns::BaseController
  before_action :load_google_api_client
  def tweet
  	plus = @client.discovered_api('plus')
  	result = @client.execute(
     :api_method =>  plus.people.list,
     :parameters => {'collection' => 'visible', 'userId' => 'me'}
    )
    puts result.body

    head(:ok)
  end

  private
  def load_google_api_client
  	@client = Google::APIClient.new(application_name: 'Noroshi', application_version: '1.0.0')
    @client.authorization.client_id = "248634638505-1qpm66q3jdiu40l988j3d48vvitdkenq.apps.googleusercontent.com"
    @client.authorization.client_secret = "bJ18vHs3GhM0wKGm9T36HNHS"
    @client.authorization.access_token = @sns.token
    @client.authorization.refresh_token = @sns.token_secret
  end
end
