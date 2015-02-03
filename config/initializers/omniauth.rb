Rails.application.config.middleware.use OmniAuth::Builder do
  api_config = YAML.load(File.read("#{Rails.root}/config/api_config.yml"))
  provider :facebook, api_config["facebook"]["api_key"], api_config["facebook"]["secret"]
  provider :twitter, api_config["twitter"]["api_key"], api_config["twitter"]["secret"]
  provider :google_oauth2, api_config["google"]["api_key"], api_config["google"]["secret"], {:name => "google", :scope => "email, profile, plus.me, plus.circles.read, plus.circles.write, plus.stream.read, plus.stream.write", approval_prompt: "auto", :prompt => "select_account"}
end