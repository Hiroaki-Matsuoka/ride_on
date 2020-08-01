AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Ride.create(title: "アワイチライド", message: "みんなで淡路島を一周しよう！", address: "大阪府和泉市", user_id: 1)
Ride.create(title: "ビワイチライド", message: "みんなで琵琶湖を一周しよう！", address: "大阪府和泉市", user_id: 1)
Ride.create(title: "高野山ライド", message: "みんなで高野山へいこう！", address: "大阪府和泉市", user_id: 1)

User.create!(name: "Hiro",
            email: "test@example.com",
            password: "password",
            password_confirmation: "password",
            image_name: "default.jpeg")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               image_name: "default.jpeg")
end
