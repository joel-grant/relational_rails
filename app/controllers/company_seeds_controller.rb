class CompanySeedsController < ApplicationController
  def index
    company = Company.find(params[:id])
    @seeds = company.seeds
    require 'pry'; binding.pry
  end
end
