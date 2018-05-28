require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "ActiveRecord" do
    context "belong_to" do
      it{is_expected.to belong_to :user}
      it{is_expected.to belong_to :product}
    end
  end

  describe "ActiveModel" do
    context "presence" do
      it{is_expected.to validate_presence_of :content}
    end
  end
end
