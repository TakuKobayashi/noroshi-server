json.partial! 'each', stage: @stage
json.set! "users" do
  json.array!(@users) do |user|
    json.user_id user.id
    json.name user.name
  end
end