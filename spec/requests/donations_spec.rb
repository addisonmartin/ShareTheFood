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

RSpec.describe "/donations", type: :request do
  # Donation. As you add validations to Donation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:donation)
  }

  let(:invalid_attributes) {
    attributes_for(:post)
  }

  describe "GET /index" do
    it "renders a successful response" do
      Donation.create! valid_attributes
      get donations_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      donation = Donation.create! valid_attributes
      get donation_url(donation)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_donation_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      donation = Donation.create! valid_attributes
      get edit_donation_url(donation)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Donation" do
        expect {
          post donations_url, params: { donation: valid_attributes }
        }.to change(Donation, :count).by(1)
      end

      it "redirects to the created donation" do
        post donations_url, params: { donation: valid_attributes }
        expect(response).to redirect_to(donation_url(Donation.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Donation" do
        expect {
          post donations_url, params: { donation: invalid_attributes }
        }.to change(Donation, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post donations_url, params: { donation: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested donation" do
        donation = Donation.create! valid_attributes
        patch donation_url(donation), params: { donation: new_attributes }
        donation.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the donation" do
        donation = Donation.create! valid_attributes
        patch donation_url(donation), params: { donation: new_attributes }
        donation.reload
        expect(response).to redirect_to(donation_url(donation))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        donation = Donation.create! valid_attributes
        patch donation_url(donation), params: { donation: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested donation" do
      donation = Donation.create! valid_attributes
      expect {
        delete donation_url(donation)
      }.to change(Donation, :count).by(-1)
    end

    it "redirects to the donations list" do
      donation = Donation.create! valid_attributes
      delete donation_url(donation)
      expect(response).to redirect_to(donations_url)
    end
  end
end
