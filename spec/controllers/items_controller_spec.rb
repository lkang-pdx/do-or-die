require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  include Devise::Test::ControllerHelpers
  let(:user) { create(:user) }
  let(:item) { create(:item) }

  before do
    sign_in user
  end


  describe "POST create" do
    it "create new item" do
      post :create, item: attributes_for(:item), :user_id => user.id
      expect(Item.count).to eq(1)
    end
  end
end
