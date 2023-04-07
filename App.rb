require 'sinatra/base'
require_relative 'application/entry_point/user_entrypoint'

class App < Sinatra::Base
  use UserEntrypoint

  run! if __FILE__ == $0
end

