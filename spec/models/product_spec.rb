require "rails_helper"

RSpec.describe Product, type: :model do
  describe "ActiveRecord" do
    context "has_many" do
      it{is_expected.to have_many(:bill_details)}
      it{is_expected.to have_many(:rates)}
      it{is_expected.to have_many(:comments)}
      it{is_expected.to have_many(:product_images)}
    end

    context "belong_to" do
      it{is_expected.to belong_to :brand}
      it{is_expected.to belong_to :category}
    end

    context "accept_nested_attributes_for" do
      it{is_expected.to accept_nested_attributes_for :product_images}
    end
  end

  describe "ActiveModel" do
    context "presence" do
      it{is_expected.to validate_presence_of :name}
      it{is_expected.to validate_presence_of :price}
      it{is_expected.to validate_presence_of :content}
      it{is_expected.to validate_presence_of :description}
      it{is_expected.to validate_presence_of :quantity}
    end

    context "numericality" do
      it{is_expected.to validate_numericality_of :price}
      it{is_expected.to validate_numericality_of :quantity}
    end

    context "length" do
      it do
        is_expected.to validate_length_of(:name).is_at_most Settings.max_length
      end
    end

    context "uniqueness" do
      subject{FactoryBot.build :product}
      it{is_expected.to validate_uniqueness_of :name}
    end
  end
end
