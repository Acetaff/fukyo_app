class FukyosController < ApplicationController

  def index 
  end
  
  def new
    @fukyo = Fukyo.new
  end

  def create
    @fukyo = Fukyo.new(fukyo_params)
    if @fukyo.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def fukyo_params
    params.require(:fukyo).permit(:title, :f_text, :f_url).merge(user_id: current_user.id)
  end

end
