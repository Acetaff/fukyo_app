class FukyosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_fukyo, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :destroy]

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
    @comment = Comment.new
    @comments = @fukyo.comments.includes(:user)
    @user = @fukyo.user
    @favorite_count = Favorite.where(fukyo_id: @fukyo.id).count
  end

  def edit
  end

  def update
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

  def set_fukyo
    @fukyo = Fukyo.find(params[:id])
  end

  def move_to_index 
    @fukyo = Fukyo.find(params[:id])
    unless current_user == @fukyo.user
      redirect_to root_path
    end
  end

end
