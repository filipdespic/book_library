class RentalsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_rental, only: %i[ show edit update destroy ]

  # GET /rentals or /rentals.json
  def index
    @rentals = Rental.all
  end


  # GET /rentals/new
  def new
    @rental = Rental.new
  end


  # POST /rentals or /rentals.json
  def create
    @rental = Rental.new(rental_params)

    respond_to do |format|
      if @rental.save
        format.html { redirect_to rentals_path, notice: "Rental was successfully created." }
        format.json { render :show, status: :created, location: @rental }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rentals/1 or /rentals/1.json
  def destroy
    @rental.destroy
    respond_to do |format|
      format.html { redirect_to rentals_url, notice: "Rental was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rental_params
      params.require(:rental).permit(:user_id, :book_id)
    end
end
