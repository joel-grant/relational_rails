class SeedsController < ApplicationController
  def index
    @seeds = Seed.all     
  end

  def show
    @seed = Seed.find(params[:id])
  end
end 