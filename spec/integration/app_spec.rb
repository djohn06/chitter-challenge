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
  
    context "Get /signup" do
      it 'returns 200 OK' do
        response = get('/signup')
  
        expect(response.status).to eq(200)
        expect(response.body).to include('<input type="text" name="email" />')
        expect(response.body).to include('<label>Password: </label>')
        expect(response.body).to include('<input type="text" name="username" />')
      end
    end
  end
end