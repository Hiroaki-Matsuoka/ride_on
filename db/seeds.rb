AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

users= [
{ name: 'Hiro', email: 'test@example.com', password: 'password', image_name: 'default.jpeg', introduce: 'よろしくおねがいします' },
{ name: 'Tom', email: 'hoge@example.com', password: 'password', image_name: 'default1.png', introduce: 'よろしくおねがいします' },
{ name: 'Jakub', email: 'foo@example.com', password: 'password', image_name: 'default2.png', introduce: 'よろしくおねがいします' },
{ name: 'Mike', email: 'bar@example.com', password: 'password', image_name: 'default3.png', introduce: 'よろしくおねがいします' },
{ name: 'Mat', email: 'ba@example.com', password: 'password', image_name: 'default4.png', introduce: 'よろしくおねがいします' },
{ name: 'hoges', email: 'br@example.com', password: 'password', image_name: 'default5.png', introduce: 'よろしくおねがいします' },
{ name: 'foo', email: 'b@example.com', password: 'password', image_name: 'default.jpeg', introduce: 'よろしくおねがいします' },
{ name: 'bar', email: 'ar@example.com', password: 'password', image_name: 'default.jpeg', introduce: 'よろしくおねがいします' },
{ name: 'hoge', email: 'fo@example.com', password: 'password', image_name: 'default.jpeg', introduce: 'よろしくおねがいします' },
{ name: 'hogehoge', email: 'hg@example.com', password: 'password', image_name: 'default.jpeg', introduce: 'よろしくおねがいします' },
{ name: 'foobar', email: 'testes@example.com', password: 'password', image_name: 'default.jpeg', introduce: 'よろしくおねがいします' },
{ name: 'for', email: 'testes99@example.com', password: 'password', image_name: 'default.jpeg', introduce: 'よろしくおねがいします' },
{ name: 'fobr', email: 'testes100@example.com', password: 'password', image_name: 'default.jpeg', introduce: 'よろしくおねがいします' },
]
users.each do |record|
 User.create!(record) unless User.find_by(email: record[:email])
end
