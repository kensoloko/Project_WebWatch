require "rails_helper"

RSpec.describe ProductImage, type: :model do
  describe "ActiveRecord" do
    context "belong_to" do
      it{is_expected.to belong_to :product}
    end
  end
end
