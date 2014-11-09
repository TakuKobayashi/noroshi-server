Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1468503420078874", "c583f06de5e2bbc16561ae62bf8014fb"
  provider :twitter, "FsRNQOHICbiLaelPwW9GQ6Okb", "Doz7ypYbxH87zIvlgxcwezDYgHkvynQ589xok9vHfVowUXzHqE"
  provider :google_oauth2, "248634638505-1qpm66q3jdiu40l988j3d48vvitdkenq.apps.googleusercontent.com", "bJ18vHs3GhM0wKGm9T36HNHS", {:name => "google", :scope => "email, profile, plus.me, plus.circles.read, plus.circles.write, plus.stream.read, plus.stream.write", approval_prompt: "auto", :prompt => "select_account"}
end