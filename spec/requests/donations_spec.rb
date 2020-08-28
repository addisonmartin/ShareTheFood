# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/donations', type: :request do
  let(:invalid_attributes) do
    attributes_for(:post)
  end

  describe 'GET /index' do
    context 'when not signed in' do
      it 'renders a successful response' do
        create(:donation)
        get donations_url
        expect(response).to be_successful
      end
    end

    context 'when signed in' do
      it 'renders a successful response' do
        sign_in create(:user)

        create(:donation)
        get donations_url
        expect(response).to be_successful
      end
    end

    context 'when signed in as an admin' do
      it 'renders a successful response' do
        sign_in create(:admin)

        create(:donation)
        get donations_url
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /show' do
    context 'when not signed in' do
      it 'renders a successful response' do
        donation = create(:donation)
        get donation_url(donation)
        expect(response).to be_successful
      end
    end

    context 'when signed in' do
      it 'renders a successful response' do
        sign_in create(:user)

        donation = create(:donation)
        get donation_url(donation)
        expect(response).to be_successful
      end
    end

    context 'when signed in as an admin' do
      it 'renders a successful response' do
        sign_in create(:admin)

        donation = create(:donation)
        get donation_url(donation)
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /new' do
    context 'when not signed in' do
      it 'redirects to the sign in page' do
        get new_donation_url
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    context 'when signed in' do
      it 'renders a successful response' do
        sign_in create(:user)

        get new_donation_url
        expect(response).to be_successful
      end
    end

    context 'when signed in as an admin' do
      it 'renders a successful response' do
        sign_in create(:admin)

        get new_donation_url
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /edit' do
    context 'when not signed in' do
      it 'redirects to the sign in page' do
        donation = create(:donation)
        get edit_donation_url(donation)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when signed in' do
      context 'when the user created the donation' do
        it 'render a successful response' do
          user = create(:user)
          sign_in user

          donation = create(:donation, user: user)
          get edit_donation_url(donation)
          expect(response).to be_successful
        end
      end

      context 'when the user did not create the donation' do
        it 'raises a not authorized error' do
          sign_in create(:user)

          donation = create(:donation)
          expect do
            get edit_donation_url(donation)
          end.to raise_error(Pundit::NotAuthorizedError)
        end
      end
    end

    context 'when signed in as an admin' do
      it 'render a successful response' do
        sign_in create(:admin)

        donation = create(:donation)
        get edit_donation_url(donation)
        expect(response).to be_successful
      end
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      context 'when not signed in' do
        it 'redirects to sign in page' do
          post donations_url, params: { donation: attributes_for(:donation) }
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      context 'when signed in' do
        it 'creates a new donation' do
          sign_in create(:user)

          expect do
            post donations_url, params: { donation: attributes_for(:donation) }
          end.to change(Donation, :count).by(1)
        end

        it 'redirects to the created donation' do
          sign_in create(:user)

          post donations_url, params: { donation: attributes_for(:donation) }
          expect(response).to redirect_to(donation_url(Donation.last, locale: 'en'))
        end
      end

      context 'when signed in as an admin' do
        it 'creates a new donation' do
          sign_in create(:admin)

          expect do
            post donations_url, params: { donation: attributes_for(:donation) }
          end.to change(Donation, :count).by(1)
        end

        it 'redirects to the created donation' do
          sign_in create(:admin)

          post donations_url, params: { donation: attributes_for(:donation) }
          expect(response).to redirect_to(donation_url(Donation.last, locale: 'en'))
        end
      end
    end

    context 'with invalid parameters' do
      context 'when not signed in' do
        it 'redirects to the sign in page' do
          post donations_url, params: { donation: invalid_attributes }
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      context 'when signed in' do
        it 'does not create a new donation' do
          sign_in create(:user)

          expect do
            post donations_url, params: { donation: invalid_attributes }
          end.to change(Donation, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          sign_in create(:user)

          post donations_url, params: { donation: invalid_attributes }
          expect(response).to be_successful
        end
      end

      context 'when signed in as an admin' do
        it 'does not create a new Donation' do
          sign_in create(:admin)

          expect do
            post donations_url, params: { donation: invalid_attributes }
          end.to change(Donation, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          sign_in create(:admin)

          post donations_url, params: { donation: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        attributes_for(:donation)
      end

      context 'when not signed in' do
        it 'redirects to the sign in page' do
          donation = create(:donation)
          patch donation_url(donation), params: { donation: new_attributes }
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      context 'when signed in' do
        context 'when the user created the donation' do
          it 'updates the requested donation' do
            user = create(:user)
            sign_in user

            donation = create(:donation, user: user)
            patch donation_url(donation), params: { donation: new_attributes }
            donation.reload

            expect(donation.name).to eq(new_attributes[:name])
            expect(donation.description).to eq(new_attributes[:description])
            expect(donation.latitude).to eq(new_attributes[:latitude])
            expect(donation.longitude).to eq(new_attributes[:longitude])
            expect(donation.pickup_notes).to eq(new_attributes[:pickup_notes])
            expect(donation.is_perishable).to eq(new_attributes[:is_perishable])
            expect(donation.requires_preparation).to eq(new_attributes[:requires_preparation])
            expect(donation.is_vegetarian).to eq(new_attributes[:is_vegetarian])
            expect(donation.is_vegan).to eq(new_attributes[:is_vegan])
            expect(donation.is_kosher).to eq(new_attributes[:is_kosher])
            expect(donation.is_halal).to eq(new_attributes[:is_halal])
            expect(donation.contains_gluten).to eq(new_attributes[:contains_gluten])
            expect(donation.contains_peanuts).to eq(new_attributes[:contains_peanuts])
            expect(donation.contains_tree_nuts).to eq(new_attributes[:contains_tree_nuts])
            expect(donation.contains_dairy).to eq(new_attributes[:contains_dairy])
            expect(donation.contains_soy).to eq(new_attributes[:contains_soy])
            expect(donation.contains_egg).to eq(new_attributes[:contains_egg])
            expect(donation.contains_fish).to eq(new_attributes[:contains_fish])
            expect(donation.contains_shellfish).to eq(new_attributes[:contains_shellfish])
          end
        end

        context 'when the user did not create the donation' do
          it 'raises a not authorized error' do
            sign_in create(:user)

            donation = create(:donation)
            expect do
              patch donation_url(donation), params: { donation: new_attributes }
            end.to raise_error(Pundit::NotAuthorizedError)
          end
        end
      end

      context 'when signed in as an admin' do
        it 'updates the requested donation' do
          sign_in create(:admin)

          donation = create(:donation)
          patch donation_url(donation), params: { donation: new_attributes }
          donation.reload

          expect(donation.name).to eq(new_attributes[:name])
          expect(donation.description).to eq(new_attributes[:description])
          expect(donation.latitude).to eq(new_attributes[:latitude])
          expect(donation.longitude).to eq(new_attributes[:longitude])
          expect(donation.pickup_notes).to eq(new_attributes[:pickup_notes])
          expect(donation.is_perishable).to eq(new_attributes[:is_perishable])
          expect(donation.requires_preparation).to eq(new_attributes[:requires_preparation])
          expect(donation.is_vegetarian).to eq(new_attributes[:is_vegetarian])
          expect(donation.is_vegan).to eq(new_attributes[:is_vegan])
          expect(donation.is_kosher).to eq(new_attributes[:is_kosher])
          expect(donation.is_halal).to eq(new_attributes[:is_halal])
          expect(donation.contains_gluten).to eq(new_attributes[:contains_gluten])
          expect(donation.contains_peanuts).to eq(new_attributes[:contains_peanuts])
          expect(donation.contains_tree_nuts).to eq(new_attributes[:contains_tree_nuts])
          expect(donation.contains_dairy).to eq(new_attributes[:contains_dairy])
          expect(donation.contains_soy).to eq(new_attributes[:contains_soy])
          expect(donation.contains_egg).to eq(new_attributes[:contains_egg])
          expect(donation.contains_fish).to eq(new_attributes[:contains_fish])
          expect(donation.contains_shellfish).to eq(new_attributes[:contains_shellfish])
        end

        it 'redirects to the donation' do
          sign_in create(:admin)

          donation = create(:donation)
          patch donation_url(donation), params: { donation: new_attributes }
          donation.reload
          expect(response).to redirect_to(donation_url(donation, locale: 'en'))
        end
      end
    end

    context 'with invalid parameters' do
      context 'when not signed in' do
        it 'redirects to the sign in page' do
          donation = create(:donation)
          patch donation_url(donation), params: { donation: invalid_attributes }
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      context 'when signed in' do
        context 'when the user did not create the donation' do
          it 'raises a not authorized error' do
            sign_in create(:user)

            donation = create(:donation)
            expect do
              patch donation_url(donation), params: { donation: invalid_attributes }
            end.to raise_error(Pundit::NotAuthorizedError)
          end
        end

        context 'when the user created the donation' do
          it "renders the donation's page" do
            user = create(:user)
            sign_in user

            donation = create(:donation, user: user)
            patch donation_url(donation), params: { donation: invalid_attributes }

            expect(response).to redirect_to(donation_path(donation, locale: 'en'))
          end
        end

      end

      context 'when signed in as an admin' do
        it "renders the donation's page" do
          sign_in create(:admin)

          donation = create(:donation)
          patch donation_url(donation), params: { donation: invalid_attributes }
          expect(response).to redirect_to(donation_path(donation, locale: 'en'))
        end
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'when not signed in' do
      it 'redirects to sign in page' do
        donation = create(:donation)
        delete donation_url(donation)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when signed in' do
      context 'when the user created the donation' do
        it 'destroys the requested donation' do
          user = create(:user)
          sign_in user

          donation = create(:donation, user: user)
          expect do
            delete donation_url(donation)
          end.to change(Donation.kept, :count).by(-1)
        end


      end

      context 'when the user did not create the donation' do
        it 'raises a not authorized error' do
          sign_in create(:user)

          donation = create(:donation)
          expect do
            delete donation_url(donation)
          end.to raise_error(Pundit::NotAuthorizedError)
        end
      end
    end

    context 'when signed in as an admin' do
      it 'destroys the requested donation' do
        sign_in create(:admin)

        donation = create(:donation)
        expect do
          delete donation_url(donation)
        end.to change(Donation.kept, :count).by(-1)
      end

      it 'redirects to the donations list' do
        sign_in create(:admin)

        donation = create(:donation)
        delete donation_url(donation)
        expect(response).to redirect_to(donations_url(locale: 'en'))
      end
    end
  end
end
