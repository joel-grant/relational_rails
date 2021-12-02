class CompanySeedsController < ApplicationController
  def index
    company = Company.find(params[:id])
    @seeds = company.seeds
  end
end
