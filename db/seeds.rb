AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

users= [
{ name: 'Hiro', email: 'test@example.com', password: 'password', image_name: 'default.jpeg', introduce: 'testtesttesttesttesttesttesttest' },
{ name: 'Aki', email: 'hoge@example.com', password: 'password', image_name: 'default.jpeg', introduce: 'testtesttesttesttesttesttesttest' },
{ name: 'Jakub', email: 'foo@example.com', password: 'password', image_name: 'default.jpeg', introduce: 'testtesttesttesttesttesttesttest' },
{ name: 'you', email: 'bar@example.com', password: 'password', image_name: 'default.jpeg', introduce: 'testtesttesttesttesttesttesttest' },
{ name: 'まつおか', email: 'ba@example.com', password: 'password', image_name: 'default.jpeg', introduce: 'testtesttesttesttesttesttesttest' },
{ name: 'ひろあき', email: 'br@example.com', password: 'password', image_name: 'default.jpeg', introduce: 'testtesttesttesttesttesttesttest' },
{ name: 'foo', email: 'b@example.com', password: 'password', image_name: 'default.jpeg', introduce: 'testtesttesttesttesttesttesttest' },
{ name: 'bar', email: 'ar@example.com', password: 'password', image_name: 'default.jpeg', introduce: 'testtesttesttesttesttesttesttest' },
{ name: 'hoge', email: 'fo@example.com', password: 'password', image_name: 'default.jpeg', introduce: 'testtesttesttesttesttesttesttest' },
{ name: 'hogehoge', email: 'hg@example.com', password: 'password', image_name: 'default.jpeg', introduce: 'testtesttesttesttesttesttesttest' },
{ name: 'foobar', email: 'testes@example.com', password: 'password', image_name: 'default.jpeg', introduce: 'testtesttesttesttesttesttesttest' },
{ name: 'for', email: 'testes99@example.com', password: 'password', image_name: 'default.jpeg', introduce: 'testtesttesttesttesttesttesttest' },
{ name: 'fobr', email: 'testes100@example.com', password: 'password', image_name: 'default.jpeg', introduce: 'testtesttesttesttesttesttesttest' },
]
users.each do |record|
 User.create!(record) unless User.find_by(email: record[:email])
end
