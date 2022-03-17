class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.fukyo_sya
    @tweets = user.fukyos
  end
end
