class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    
  end

  def create
    company = Company.create!(company_params)
    redirect_to '/companies'
  end

  private
  def company_params
    params.permit(:name, :accepting_orders, :years_active)
  end
end
