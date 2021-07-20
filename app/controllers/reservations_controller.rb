class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id)
    @rooms = Room.all
  end
  def new
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:room_id])
    @reservation.total_price = @room.price * @reservation.person_num * (@reservation.end_date.to_date - @reservation.start_date.to_date).to_i
  end

  def create
    @reservation = Reservation.new(reservations_params)
    @reservation.user_id = current_user.id
      if @reservation.save
        flash[:notice] = "予約情報を新規登録しました"
        redirect_to @reservation
      else
        render "new"
      end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @room = @reservation.room
  end

  def edit
  end

  def update
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "ルーム情報を削除しました"
    redirect_to :reservations
  end
  private
    def reservation_params
      params.permit(:start_date, :end_date, :person_num, :room_id).merge(user_id: current_user.id)
    end
    def reservations_params
      params.require(:reservation).permit(:start_date, :end_date, :person_num, :total_price, :room_id).merge(user_id: current_user.id)
    end
end
