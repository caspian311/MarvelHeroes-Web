unless Rails.env.production?
  user = User.create name: 'Matt', email: 'matt.c.todd@gmail.com', password: 'P@$$W0rd'
  ApiAccess.create user: user, api_key: 'ABC123'
end
