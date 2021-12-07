class CompanySeedsController < ApplicationController
  def index
    @company = Company.find(params[:id])
    if params[:order]
      @seeds = @company.seeds.alphabetize(params[:id])
    elsif params[:quantity]
      @seeds = @company.seeds.filter_threshold(params[:quantity])
    else
      @seeds = @company.seeds
    end

  end

  def new
    @company = Company.find(params[:id])
  end

  def create
    company = Company.find(params[:id])
    seed = company.seeds.create!(seed_params)

    redirect_to "/companies/#{company.id}/seeds"
  end

  private
  def seed_params
    params.permit(:name, :available, :quantity)
  end
end
