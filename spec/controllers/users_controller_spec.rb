# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersController, type: :controller do
  @user = User.create(email: Faker::Internet.email, password: 'password', password_confirmation: 'password', fname: Faker::Name.first_name, lname: Faker::Name.last_name, address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.phone_number, circle_id: Circle.create)

  describe 'show' do
    before do
      get :show
    end
    it { expect(response).to be_successful }
  end
end

# describe 'GET #show' do
#   @user = FactoryBot.create :user

#  before(:each) do get :show end
#   it 'returns the information about a reporter on a hash' do
#     user_response = JSON.parse(response.body, symbolize_names: true)
#     expect(user_response[:email]).to eql @user.email
#   end

#   # it { should respond_with 200 }
# end
