unless Rails.env.production?
  user = User.create name: 'Matt', email: 'matt.c.todd@gmail.com', password: 'P@$$W0rd'
  ApiAccess.create user: user, public_key: 'not a real key', private_key: 'not a real key', api_key: 'ABC123'
end
