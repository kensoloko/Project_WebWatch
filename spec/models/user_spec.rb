require "rails_helper"

RSpec.describe User, type: :model do
  describe "#email_downcase" do
    context "when emal uppercase ABC@gmail.com" do
      before{@user = FactoryBot.build :user}
      subject{@user}
      it do
        is_expected.to receive(:email_downcase)
        @user.run_callbacks(:save)
      end
    end
  end

  describe "ActiveRecord" do
    context "has_many" do
      it{is_expected.to have_many(:bills)}
      it{is_expected.to have_many(:rates)}
      it{is_expected.to have_many(:comments)}
    end

    context "has_secure_password" do
      it{is_expected.to have_secure_password}
    end
  end

  describe "ActiveModel" do
    context "presence" do
      it{is_expected.to validate_presence_of(:name)}
      it{is_expected.to validate_presence_of(:email)}
      it{is_expected.to validate_presence_of(:phone)}
      it{is_expected.to validate_presence_of(:address)}
    end

    context "length" do
      it do
        is_expected.to validate_length_of(:name).is_at_most(Settings.max_length)
      end
      it do
        is_expected.to validate_length_of(:email)
          .is_at_most(Settings.email_max_length)
      end
      it do
        is_expected.to validate_length_of(:phone)
          .is_at_most(Settings.phone_max_length)
      end
    end

    context "uniqueness" do
      subject{FactoryBot.build :user}
      it{is_expected.to validate_uniqueness_of :email}
      it{is_expected.to validate_uniqueness_of(:phone).case_insensitive}
    end
  end
end
