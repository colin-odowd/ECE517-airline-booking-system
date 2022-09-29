class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]

  # GET /reservations or /reservations.json
  def index
    @reservations = Reservation.all.select{|r| @current_user.admin || r.user_id == @current_user.id}
  end

  # GET /reservations/1 or /reservations/1.json
  def show
    @reservations = Reservation.find(params[:id])
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
    @reservation = Reservation.find(params[:id])
  end

  # POST /reservations or /reservations.json
  def create
    @flight = Flight.find_by_id(reservation_params[:flight_id])
    @reservation = Reservation.new(reservation_params.permit(:passengers, :ticket_class, :amenities))
    @reservation.flight = @flight
    @reservation.user = current_user

    begin 
      @reservation.save
    rescue => e
    end
        
    respond_to do |format|
      if !e
        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully created." }
        format.json { render :show, status: :created, location: @reservation }
      else
        flash[:warning] = "Reservation was not created."
        format.html { render :new, status: :unprocessable_entity}
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update

    begin 
      @reservation.update(reservation_params)
    rescue => e
    end

    respond_to do |format|
      if !e
        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        flash[:warning] = "Reservation was not updated."
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.fetch(:reservation, {})
      params.require(:reservation).permit(:flight_id, :passengers, :ticket_class, :amenities)
    end
end
