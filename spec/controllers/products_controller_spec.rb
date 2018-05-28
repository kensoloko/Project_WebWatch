require "rails_helper"

RSpec.describe ProductsController, type: :controller do
  describe "GET #index" do
    before{get :index}
    context "@products" do
      let(:products){FactoryBot.create :product}
      subject{assigns(:products)}
      it{is_expected.to eq [products]}
    end

    context "render view" do
      subject{response}
      it{is_expected.to render_template :index}
    end
  end

  describe "GET #show" do
    let(:product){FactoryBot.create :product}
    before{get :show, params: {id: product.id}}
    context "@product" do
      subject{assigns(:product)}
      it{is_expected.to eq product}
    end

    context "render view" do
      subject{response}
      it{is_expected.to render_template :show}
    end

    context "product not found" do
      before{get :show, params: {id: 100}}
      subject{response}
      it{is_expected.to redirect_to root_url}
    end
  end

  describe "GET #fillter" do
    let(:product){FactoryBot.create :product}
    context "new" do
      before{get :fillter, params: {status: "new"}}
      subject{response}
      it{is_expected.to render_template :fillter}
    end

    context "hot" do
      before{get :fillter, params: {status: "hot"}}
      subject{response}
      it{is_expected.to render_template :fillter}
    end
  end

  describe "#load_product" do

  end
end
