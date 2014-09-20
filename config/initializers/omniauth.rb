Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "App_ID", "App_Secret"
  provider :twitter, "FsRNQOHICbiLaelPwW9GQ6Okb", "Doz7ypYbxH87zIvlgxcwezDYgHkvynQ589xok9vHfVowUXzHqE"
end