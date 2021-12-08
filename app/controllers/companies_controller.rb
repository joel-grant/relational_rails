class CompaniesController < ApplicationController
  def index
    if params[:keyword]
      @companies = Company.partial_match(params[:keyword])
    else
      @companies = Company.all
    end
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

  def edit
    @company = Company.find(params[:id])
  end

  def update
    company = Company.find(params[:id])
    company.update(company_params)
    redirect_to "/companies/#{company.id}"
  end

  def destroy
    company = Company.find(params[:id])
    company.seeds.destroy_all
    company.destroy

    redirect_to "/companies"
  end

  private
  def company_params
    params.permit(:name, :accepting_orders, :years_active)
  end
end
