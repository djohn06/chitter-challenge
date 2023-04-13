require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peeps_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('chitter')

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    repo = PeepsRepository.new

    @peeps = repo.all

    return erb(:chitter)
  end

  get '/new_peep' do
    return erb(:new_peep)
  end

  get '/signup' do
    return erb(:signup)
  end

  get '/login' do
    return erb(:login)
  end
end
