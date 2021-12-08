class SeedsController < ApplicationController
  def index
    if params[:keyword]
      @seeds = Seed.partial_match(params[:keyword])
    else
      @seeds = Seed.all
    end 
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

  def destroy
    seed = Seed.find(params[:id])
    seed.destroy
    redirect_to "/seeds"
  end

  private
    def seed_params
      params.permit(:name, :available, :quantity)
    end
end
