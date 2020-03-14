if Rails.env == "development"
  50.times do |i|
    User.create!(
      name: "test#{i + 1}", 
      email: "test#{i + 1}@test.com", 
      password: "aaa", 
      password_confirmation: "aaa",
    )
  end
end