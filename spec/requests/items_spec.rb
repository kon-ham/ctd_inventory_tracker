require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/items", type: :request do
  before(:each) do
    @user = User.create(email: 'user@test.com', password: 'test_password')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  # Item. As you add validations to Item, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {{
    name: "Bob's McBobble Heads",
    quantity: 10,
    user_id: @user.id
  }}

  let(:invalid_attributes) {{
    name: "",
    quantity: "",
    user_id: @user.id
  }}

  describe "GET /show" do
    it "renders a successful response" do
      item = Item.create! valid_attributes
      get "/items/#{item.id}"
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get "/items/new"
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      item = Item.create! valid_attributes
      get "/items/#{item.id}/edit"
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Item" do
        expect {
          post items_url, params: { item: valid_attributes }
        }.to change(Item, :count).by(1)
      end

      it "redirects to the created item" do
        post items_url, params: { item: valid_attributes }
        expect(response).to redirect_to(item_url(Item.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Item" do
        expect {
          post items_url, params: { item: invalid_attributes }
        }.to change(Item, :count).by(0)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {{
        name: "Bobette's McBobble Heads",
        quantity: 99
      }}

      it "updates the requested item" do
        item = Item.create! valid_attributes
        patch item_url(item), params: { item: new_attributes }
        item.reload
        expect(item.name).to eq("Bobette's McBobble Heads")
        expect(item.quantity).to eq(99)
        expect(item.name).to_not eq("Bob's McBobble Heads")
        expect(item.quantity).to_not eq(10)
      end

      it "redirects to the item" do
        item = Item.create! valid_attributes
        patch item_url(item), params: { item: new_attributes }
        item.reload
        expect(response).to redirect_to(item_url(item))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        item = Item.create! valid_attributes
        patch item_url(item), params: { item: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested item" do
      item = Item.create! valid_attributes
      expect {
        delete item_url(item)
      }.to change(Item, :count).by(-1)
    end

    it "redirects to the items list" do
      item = Item.create! valid_attributes
      delete item_url(item)
      expect(response).to redirect_to(items_url)
    end
  end
end
