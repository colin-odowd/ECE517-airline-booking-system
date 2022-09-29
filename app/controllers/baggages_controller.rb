class BaggagesController < ApplicationController
  before_action :set_baggage, only: %i[ show edit update destroy ]

  # GET /baggages or /baggages.json
  def index
    @baggages = Baggage.all.select{|b| @current_user.admin || b.reservation.user_id == @current_user.id}
  end

  # GET /baggages/1 or /baggages/1.json
  def show
  end

  # GET /baggages/new
  def new
    @baggage = Baggage.new
  end

  # GET /baggages/1/edit
  def edit
  end

  # POST /baggages or /baggages.json
  def create
    e = true

    reservation = Reservation.find_by_id(baggage_params[:bag_reservation_id])
    if @current_user.admin || reservation.user_id == @current_user.id
      @baggage = Baggage.new(baggage_params)
      @baggage.reservation = reservation

      begin 
        @baggage.save
        e = false
      rescue => e
      end
    end

    respond_to do |format|
      if !e
        format.html { redirect_to baggage_url(@baggage), notice: "Baggage was successfully created." }
        format.json { render :show, status: :created, location: @baggage }
      else
        flash[:warning] = "Baggage was not created."
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @baggage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /baggages/1 or /baggages/1.json
  def update

    begin 
      @flight.update(flight_params)
    rescue => e
    end

    respond_to do |format|
      if !e
        format.html { redirect_to baggage_url(@baggage), notice: "Baggage was successfully updated." }
        format.json { render :show, status: :ok, location: @baggage }
      else
        flash[:warning] = "Baggage was not updated."
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @baggage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /baggages/1 or /baggages/1.json
  def destroy
    @baggage.destroy

    respond_to do |format|
      format.html { redirect_to baggages_url, notice: "Baggage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_baggage
      @baggage = Baggage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def baggage_params
      params.require(:baggage).permit(:bag_reservation_id, :weight)
    end
end
