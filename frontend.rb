require 'unirest'

system "open 'https://accounts.spotify.com/authorize?client_id=CLIENT_ID&response_type=code&redirect_uri=http://localhost:3000/callback'"


p "enter the code here"
input_code = gets.chomp

response = Unirest.post("https://accounts.spotify.com/api/token",
  parameters: {
    client_id: 'CLIENT_ID',
    client_secret: 'CLIENT_SECRET',
    grant_type: 'authorization_code',
    code: input_code,
    redirect_uri: 'http://localhost:3000/callback'
    })

p response.body
spotify_token = response.body['access_token']


response = Unirest.get("https://api.spotify.com/v1/me",
  headers: {
    "Authorization" => "Bearer #{spotify_token}"
  }
)


p response.body
