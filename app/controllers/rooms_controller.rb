class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "ルーム情報を新規登録しました"
      redirect_to :rooms
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "ルーム情報を削除しました"
    redirect_to :rooms
  end
  private
    def room_params
      params.require(:room).permit(:room_name, :description, :price, :address, :image, :user_id)
    end
end
