require "rails_helper"

RSpec.describe Rate, type: :model do
  describe "ActiveRecord" do
    context "belong_to" do
      it{is_expected.to belong_to :user}
      it{is_expected.to belong_to :product}
    end
  end

  describe "ActiveModel" do
    context "uniqueness" do
      subject{FactoryBot.build :rate}
      it do
        is_expected.to validate_uniqueness_of(:user_id)
          .scoped_to(:product_id).case_insensitive
      end
    end
  end
end
