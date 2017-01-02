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

  describe "DELETE destroy" do
    it "deletes the item" do
      delete :destroy, format: :js, user_id: user.id, id: item.id
      count = Item.where({user_id: user.id, id: item.id}).count
      expect(count).to eq 0
    end

    it "returns http success" do
      delete :destroy, format: :js, user_id: user.id, id: item.id
      expect(response).to have_http_status(:success)
    end
  end
end
