require "rails_helper"

RSpec.describe Brand, type: :model do
  describe "ActiveRecord" do
    context "has_many" do
      it{is_expected.to have_many :products}
      it{is_expected.to have_many(:categories).through(:products)}
    end
  end

  describe "ActiveModel" do
    context "presence" do
      it{is_expected.to validate_presence_of :name}
      it{is_expected.to validate_presence_of :description}
    end

    context "length" do
      it do
        is_expected.to validate_length_of(:name).is_at_most Settings.max_length
      end
    end

    context "uniqueness" do
      subject{FactoryBot.build :brand}
      it{is_expected.to validate_uniqueness_of :name}
    end
  end
end
