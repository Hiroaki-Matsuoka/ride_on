AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

users= [
{ name: 'Hiro', email: 'test@example.com', password: 'password', image_name: 'default.jpeg' },
{ name: 'Aki', email: 'hoge@example.com', password: 'password', image_name: 'default.jpeg' },
{ name: 'Jakub', email: 'foo@example.com', password: 'password', image_name: 'default.jpeg' },
{ name: 'you', email: 'bar@example.com', password: 'password', image_name: 'default.jpeg' },
{ name: 'まつおか', email: 'ba@example.com', password: 'password', image_name: 'default.jpeg' },
{ name: 'ひろあき', email: 'br@example.com', password: 'password', image_name: 'default.jpeg' },
{ name: 'foo', email: 'b@example.com', password: 'password', image_name: 'default.jpeg' },
{ name: 'bar', email: 'ar@example.com', password: 'password', image_name: 'default.jpeg' },
{ name: 'hoge', email: 'fo@example.com', password: 'password', image_name: 'default.jpeg' },
{ name: 'hogehoge', email: 'hg@example.com', password: 'password', image_name: 'default.jpeg' },
{ name: 'foobar', email: 'testes@example.com', password: 'password', image_name: 'default.jpeg' },
{ name: 'for', email: 'testes99@example.com', password: 'password', image_name: 'default.jpeg' },
{ name: 'fobr', email: 'testes100@example.com', password: 'password', image_name: 'default.jpeg' },
]
users.each do |record|
 User.create!(record) unless User.find_by(email: record[:email])
end
