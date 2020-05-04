# frozen_string_literal: true

# == Schema Information
#
# Table name: donations
#
#  id                   :bigint(8)        not null, primary key
#  available_until      :datetime         not null
#  contains_dairy       :boolean          default(FALSE)
#  contains_egg         :boolean          default(FALSE)
#  contains_fish        :boolean          default(FALSE)
#  contains_gluten      :boolean          default(FALSE)
#  contains_peanuts     :boolean          default(FALSE)
#  contains_shellfish   :boolean          default(FALSE)
#  contains_soy         :boolean          default(FALSE)
#  contains_tree_nuts   :boolean          default(FALSE)
#  description          :text             default("")
#  discarded_at         :datetime
#  is_perishable        :boolean          default(FALSE)
#  is_vegan             :boolean          default(FALSE)
#  is_vegetarian        :boolean          default(FALSE)
#  latitude             :decimal(10, 6)   not null
#  longitude            :decimal(10, 6)   not null
#  name                 :text             not null
#  pickup_notes         :text             not null
#  requires_preparation :boolean          default(FALSE)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :bigint(8)        not null
#
# Indexes
#
#  index_donations_on_discarded_at  (discarded_at)
#  index_donations_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class DonationsController < ApplicationController
  before_action :set_donation, only: %i[show edit update destroy]
  # Redirect the User to sign in when attempting to perform actions that require them to be signed in.
  before_action :authenticate_user!, only: %i[create new update edit destroy]

  # GET /donations
  def index
    # Only get non-soft deleted Donations. Paginate the results.
    @pagination, @donations = pagy(Donation.with_attached_images.kept)

    # Ensure the User has permission to perform this action.
    authorize @donations

    # Pass some of the Donation's attributes to Javascript for use within the map.
    donation_location_information = []
    @donations.each do |donation|
      donation_location_information << {latitude: donation.latitude,
                                        longitude: donation.longitude,
                                        name: donation.name,
                                        pickup_notes: donation.pickup_notes}
    end

    gon.donation_location_information = donation_location_information

    # Decorate the Donations so its decorator methods can be used.
    @donations = @donations.decorate
  end

  # GET /donations/1
  def show
    # Ensure the User has permission to perform this action.
    authorize @donation

    # Pass some of the Donation's attributes to Javascript for use within the map.
    gon.donation_latitude = @donation.latitude
    gon.donation_longitude = @donation.longitude
    gon.donation_name = @donation.name
    gon.donation_pickup_notes = @donation.pickup_notes

    # Decorate the Donation so its decorator methods can be used.
    @donation = @donation.decorate
  end

  # GET /donations/new
  def new
    @donation = Donation.new

    # Ensure the User has permission to perform this action.
    authorize @donation
  end

  # GET /donations/1/edit
  def edit
    # Ensure the User has permission to perform this action.
    authorize @donation
  end

  # POST /donations
  def create
    @donation = Donation.new(donation_params)

    # Ensure the User has permission to perform this action.
    authorize @donation

    # Set the Donation's user to the currently logged in User.
    @donation.user = current_user

    if @donation.save
      redirect_to @donation, notice: 'Donation was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /donations/1
  def update
    # Ensure the User has permission to perform this action.
    authorize @donation

    if @donation.update(donation_params)
      redirect_to @donation, notice: 'Donation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /donations/1
  def destroy
    # Ensure the User has permission to perform this action.
    authorize @donation

    # Soft delete the Donation.
    @donation.discard
    redirect_to donations_url, notice: 'Donation was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_donation
    # Eager load attached images to increase performance.
    @donation = Donation.with_attached_images.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through:
  def donation_params
    params.require(:donation).permit(:name,
                                     :description,
                                     :latitude,
                                     :longitude,
                                     :pickup_notes,
                                     :available_until,
                                     :is_perishable,
                                     :requires_preparation,
                                     :is_vegetarian,
                                     :is_vegan,
                                     :contains_gluten,
                                     :contains_peanuts,
                                     :contains_tree_nuts,
                                     :contains_dairy,
                                     :contains_soy,
                                     :contains_egg,
                                     :contains_fish,
                                     :contains_shellfish,
                                     images: [])
  end
end
