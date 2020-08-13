class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]

  # GET /donations
  # GET /donations.json
  def index
    # Only get donations that have not been deleted.
    # Ensure the user is allowed to perform this action.
    @donations = authorize Donation.kept
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
    # Ensure the user is allowed to perform this action.
    authorize @donation
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

  # Use callbacks to share common setup or constraints between actions.
  def set_donation
    @donation = Donation.kept.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def donation_params
    params.require(:donation).permit(:user_id,
                                     :name,
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
                                     :visit_id,
                                     :images)
  end
end
