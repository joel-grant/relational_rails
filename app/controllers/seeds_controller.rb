class SeedsController < ApplicationController
  def index
    @seeds = Seed.all     
  end

  def show
    @seed = Seed.find(params[:id])
  end

  def edit
    @seed = Seed.find(params[:id])
  end

  def update
    seed = Seed.find(params[:id])

    seed.update(seed_params)

    redirect_to "/seeds/#{seed.id}"
  end

  private
    def seed_params
      params.permit(:name, :available, :quantity)
    end
end 