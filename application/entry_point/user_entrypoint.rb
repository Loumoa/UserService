require 'sinatra'
require 'json'
require_relative '../service/users_service'

class UserEntrypoint < Sinatra::Base
  get '/users' do
    content_type :json
    UserService.get_all.to_json
  end

  get '/users/:id' do
    content_type :json
    user = UserService.get(params[:id].to_i)
    halt 404 unless user

    user.to_json
  end

  post '/users' do
    content_type :json
    user = UserService.add(params)

    status 201
    user.to_json
  end

  put '/users/:id' do
    content_type :json
    user = UserService.update(params[:id].to_i, params)
    halt 404 unless user

    user.to_json
  end

  delete '/users/:id' do
    content_type :json
    UserService.delete(params[:id].to_i)

    status 204
  end
end
