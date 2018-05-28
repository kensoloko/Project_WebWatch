require "rails_helper"

RSpec.describe BillDetail, type: :model do
  describe "ActiveRecord" do
    context "belong_to" do
      it{is_expected.to belong_to :bill}
      it{is_expected.to belong_to :product}
    end
  end

  describe "ActiveModel" do
    context "numericality" do
      it{is_expected.to validate_numericality_of :quantity}
    end

    context "presence" do
      it{is_expected.to validate_presence_of :quantity}
    end
  end
end
