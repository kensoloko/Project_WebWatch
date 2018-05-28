require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    context "with valid attributes" do
      let(:users){FactoryBot.attributes_for(:user)}
      before{post :create, params: {user: users}}
      subject{User.count}
      it{is_expected.to eq 1}
    end
  end
end
