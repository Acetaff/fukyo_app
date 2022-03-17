class UsersController < ApplicationController
  def show
    @fukyo_sya = current_user.fukyo_sya
    @fukyos = current_user.fukyos
  end
end
