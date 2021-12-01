class SeedsController < ApplicationController
  def index
    @seeds = Seed.all     
  end
end 