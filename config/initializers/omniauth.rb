Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1468503420078874", "c583f06de5e2bbc16561ae62bf8014fb"
  provider :twitter, "FsRNQOHICbiLaelPwW9GQ6Okb", "Doz7ypYbxH87zIvlgxcwezDYgHkvynQ589xok9vHfVowUXzHqE"
end