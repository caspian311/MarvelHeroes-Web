
user = User.create name: 'Matt', email: 'matt.c.todd@gmail.com', password: 'P@$$W0rd'
api_key = ApiAccess.create user: user, api_key: 'ABC123'
