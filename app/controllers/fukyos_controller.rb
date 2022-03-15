class FukyosController < ApplicationController

  def index 
    @fukyos = Fukyo.includes(:user).order("created_at DESC")
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

  def show
    @fukyo = Fukyo.find(params[:id])
  end

  def edit
    @fukyo = Fukyo.find(params[:id])
  end

  def update
    @fukyo = Fukyo.find(params[:id])
    if @fukyo.update(fukyo_params)
      redirect_to fukyo_path(@fukyo.id)
    else
      render :edit
    end
  end

  def destroy
    fukyo = Fukyo.find(params[:id])
    fukyo.destroy
    redirect_to root_path
  end

  private
  
  def fukyo_params
    params.require(:fukyo).permit(:title, :f_text, :f_url, :image).merge(user_id: current_user.id)
  end

end
