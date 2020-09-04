# frozen_string_literal: true

class DonationsController < ApplicationController
  include DonationsHelper

  before_action :set_donation, only: [:show, :edit, :update, :destroy]
  # Redirect the user to sign in before performing any actions that require a user to be signed in.
  before_action :authenticate_user!, only: [:create, :new, :update, :edit, :destroy]

  # GET /donations
  # GET /donations.json
  def index
    # Ensure the user is allowed to perform this action.
    # Eager load the donation's images.
    # Only get donations that have not been deleted.
    @donations = authorize Donation.with_attached_images.kept
    # Return donations within the user selected range from the user selected location (or their current location).
    @donations = @donations.near(search_from, search_range)
    # Paginate the results.
    @pagination, @donations = pagy(@donations)
    # Pass the donations' location information to Javascript, so the locations can be rendered in the embedded map.
    pass_donations_locations_to_javascript
    # Decorate the donations so its decorator methods can be used within views.
    @donations = @donations.decorate
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
    # Ensure the user is allowed to perform this action.
    authorize @donation
    # Decorate the donation so its decorator methods can be used within views.
    @donation = @donation.decorate
    # Pass the donation's location information to Javascript, so the location can be rendered in the embedded map.
    gon.donation_name = @donation.name
    gon.donation_address = @donation.address
    gon.donation_latitude = @donation.latitude
    gon.donation_longitude = @donation.longitude
    gon.donation_pickup_notes = @donation.pickup_notes
    # Use conditional GET to only return the donation if the user's locally cached version is stale.
    fresh_when last_modified: @donation.updated_at.utc, etag: @donation
  end

  # GET /donations/new
  def new
    # Ensure the user is allowed to perform this action.
    @donation = authorize Donation.new
  end

  # GET /donations/1/edit
  def edit
    # Ensure the user is allowed to perform this action.
    authorize @donation
  end

  # POST /donations
  # POST /donations.json
  def create
    # Ensure the user is allowed to perform this action.
    @donation = authorize Donation.new(donation_params)
    # Attach the current user to the donation.
    @donation.user = current_user

    respond_to do |format|
      if @donation.save
        format.html { redirect_to @donation, notice: 'Donation was successfully created.' }
        format.json { render :show, status: :created, location: @donation }
      else
        format.html { render :new }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donations/1
  # PATCH/PUT /donations/1.json
  def update
    # Ensure the user is allowed to perform this action.
    authorize @donation

    respond_to do |format|
      if @donation.update(donation_params)
        format.html { redirect_to @donation, notice: 'Donation was successfully updated.' }
        format.json { render :show, status: :ok, location: @donation }
      else
        format.html { render :edit }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.json
  def destroy
    # Ensure the user is allowed to perform this action.
    authorize @donation

    @donation.discard
    respond_to do |format|
      format.html { redirect_to donations_url, notice: 'Donation was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  # Pass the donations' location information to Javascript, so the locations can be rendered in the embedded map.
  def pass_donations_locations_to_javascript
    gon.donations_locations = []
    @donations.each do |donation|
      gon.donations_locations << { 'name': donation.name,
                                   'address': donation.address,
                                   'latitude': donation.latitude,
                                   'longitude': donation.longitude,
                                   'pickup_notes': donation.pickup_notes }
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_donation
    @donation = Donation.kept.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
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
                                     :is_kosher,
                                     :is_halal,
                                     :contains_gluten,
                                     :contains_peanuts,
                                     :contains_tree_nuts,
                                     :contains_dairy,
                                     :contains_soy,
                                     :contains_egg,
                                     :contains_fish,
                                     :contains_shellfish,
                                     :images)
  end
end
