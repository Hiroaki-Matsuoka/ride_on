AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

User.create(name: "jakub", email: "hoge@email.com", password: "password", password_confirmation: "password")
User.create(name: "miyo", email: "foo@email.com", password: "password", password_confirmation: "password")
User.create(name: "dany", email: "bar@email.com", password: "password", password_confirmation: "password")
Ride.create(title: "アワイチライド", message: "みんなで淡路島を一周しよう！", address: "大阪府和泉市", user_id: 1)
Ride.create(title: "ビワイチライド", message: "みんなで琵琶湖を一周しよう！", address: "大阪府和泉市", user_id: 1)
Ride.create(title: "高野山ライド", message: "みんなで高野山へいこう！", address: "大阪府和泉市", user_id: 1)
