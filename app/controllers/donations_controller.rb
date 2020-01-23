# frozen_string_literal: true

class DonationsController < ApplicationController
  before_action :set_donation, only: %i[show edit update destroy]
  # Verifies that authorize has been called on each controller action.
  after_action :verify_authorized

  # GET /donations
  def index
    @donations = Donation.all
    authorize @donations
  end

  # GET /donations/1
  def show; end

  # GET /donations/new
  def new
    @donation = Donation.new
    authorize @donation
  end

  # GET /donations/1/edit
  def edit; end

  # POST /donations
  def create
    @donation = Donation.new(donation_params)
    authorize @donation

    if @donation.save
      redirect_to @donation, notice: 'Donation was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /donations/1
  def update
    if @donation.update(donation_params)
      redirect_to @donation, notice: 'Donation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /donations/1
  def destroy
    @donation.destroy
    redirect_to donations_url, notice: 'Donation was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_donation
    @donation = Donation.find(params[:id])
    authorize @donation
  end

  # Only allow a trusted parameter "white list" through.
  def donation_params
    params.require(:donation).permit(:name,
                                     :description,
                                     :fresh_until,
                                     :latitude,
                                     :longitude,
                                     :pickup_notes,
                                     :is_perishable,
                                     :requires_preparation,
                                     :is_vegetarian,
                                     :is_vegan,
                                     :is_gluten_free,
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
