require "rails_helper"

RSpec.describe Bill, type: :model do
  describe "ActiveRecord" do
    context "has_many" do
      it{is_expected.to have_many :bill_details}
    end

    context "belong_to" do
      it{is_expected.to belong_to :user}
    end

    context "accept_nested_attributes_for" do
      it{is_expected.to accept_nested_attributes_for :bill_details}
    end
  end

  describe "ActiveModel" do
    context "numericality" do
      it{is_expected.to validate_numericality_of :status}
    end
  end
end
