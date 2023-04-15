require 'spec_helper'
require_relative '../application/entry_point/user_entrypoint'

describe 'User API' do
    let(:new_user) do
    {
        name: 'John Doe',
        user_type: 'customer',
        email: 'john@example.com',
        password: 'password123',
        phone: '555-123-4567'
    }
    end
    
  it 'returns a list of users' do
    get '/users'

    expect(last_response.status).to eq(200)
    expect(JSON.parse(last_response.body)).to be_an_instance_of(Array)
  end
end
