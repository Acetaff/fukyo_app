class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @fukyo_sya = user.fukyo_sya
    @fukyos = user.fukyos
  end
end
