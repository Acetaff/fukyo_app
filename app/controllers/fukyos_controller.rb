class FukyosController < ApplicationController

  def index 
  end
  
  def new
    @fukyo = Fukyo.new
  end

end
