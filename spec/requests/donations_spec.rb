# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/donations', type: :request do
  let(:valid_attributes) do
    attributes_for(:donation, user_id: create(:user).id)
  end

  let(:invalid_attributes) do
    %i[not_valid also_not_valid still_not_valid]
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Donation.create! valid_attributes
      get donations_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      donation = Donation.create! valid_attributes
      get donation_url(donation)
      expect(response).to be_successful
    end
  end

  # describe 'GET /new' do
  #   it 'renders a successful response' do
  #     get new_donation_url
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe 'GET /edit' do
  #   it 'render a successful response' do
  #     donation = Donation.create! valid_attributes
  #     get edit_donation_url(donation)
  #     expect(response).to be_successful
  #   end
  # end
  #
  describe 'POST /create' do
  #   context 'with valid parameters' do
  #     it 'creates a new Donation' do
  #       expect do
  #         post donations_url, params: { donation: valid_attributes }
  #       end.to change(Donation, :count).by(1)
  #     end
  #
  #     it 'redirects to the created donation' do
  #       post donations_url, params: { donation: valid_attributes }
  #       expect(response).to redirect_to(donation_url(Donation.last))
  #     end
  #   end

    context 'with invalid parameters' do
      it 'does not create a new Donation' do
        expect do
          post donations_url, params: { donation: invalid_attributes }
        end.to change(Donation, :count).by(0)
      end

      # it "renders a successful response (i.e. to display the 'new' template)" do
      #   post donations_url, params: { donation: invalid_attributes }
      #   expect(response).to be_successful
      # end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested donation' do
        donation = Donation.create! valid_attributes
        patch donation_url(donation), params: { donation: new_attributes }
        donation.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the donation' do
        donation = Donation.create! valid_attributes
        patch donation_url(donation), params: { donation: new_attributes }
        donation.reload
        expect(response).to redirect_to(donation_url(donation))
      end
    end

    # context 'with invalid parameters' do
    #   it "renders a successful response (i.e. to display the 'edit' template)" do
    #     donation = Donation.create! valid_attributes
    #     patch donation_url(donation), params: { donation: invalid_attributes }
    #     expect(response).to be_successful
    #   end
    # end
  end

  # describe 'DELETE /destroy' do
  #   it 'destroys the requested donation' do
  #     donation = Donation.create! valid_attributes
  #     expect do
  #       delete donation_url(donation)
  #     end.to change(Donation, :count).by(-1)
  #   end
  #
  #   it 'redirects to the donations list' do
  #     donation = Donation.create! valid_attributes
  #     delete donation_url(donation)
  #     expect(response).to redirect_to(donations_url)
  #   end
  # end
end
