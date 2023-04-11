require 'spec_helper'
require 'rack/test'
require_relative "../../app"

describe Application do
  include Rack::Test::Methods
  
  let(:app) { Application.new }
  
  context "GET /new_message" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = get('/new_message')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/new_message">')
      expect(response.body).to include('<input type="text" name="message" />')
    end
  end

  context "Get /signup" do
    it 'returns 200 OK' do
      response = get('/signup')

      expect(response.status).to eq(200)
      expect(response.body).to include('<input type="text" name="email" placeholder="Email" />')
      expect(response.body).to include('<input type="text" name="password" placeholder="Password" />')
      expect(response.body).to include('<input type="text" name="username" placeholder="Username" />')
    end
  end

  context "Get /login" do
    it 'returns 200 OK' do
      response = get('/login')

      expect(response.status).to eq(200)
      expect(response.body).to include('<input type="text" name="username" placeholder="username"/>')
      expect(response.body).to include('<input type="password" name="password" placeholder="password"/>')
      expect(response.body).to include('<input type="submit" value="Login"/>')
    end
  end
end
