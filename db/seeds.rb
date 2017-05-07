unless Rails.env.production?
  puts 'Seeding database...'
  user = User.create name: 'Matt', email: 'matt.c.todd@gmail.com', password: 'password'
  ApiAccess.create user: user, public_key: 'not a real key', private_key: 'not a real key', api_key: 'ABC123'

  User.create name: 'Incomplete User', email: 'not_a_real@email.address', password: 'password'
end
