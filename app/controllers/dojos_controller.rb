class DojosController < ApplicationController
  def index
    @dojos = Dojo.all
  end

  def show
    @dojo = Dojo.find(params[:id])
  end

  def new
  end

  def create
    dojo = Dojo.create!(dojo_params)
    redirect_to '/dojos'
  end

  def edit
    @dojo = Dojo.find(params[:id])
  end

  def update
    dojo = Dojo.find(params[:id])
    dojo.update(dojo_params)
    redirect_to "/dojos/#{dojo.id}"
  end

  private
  def dojo_params
    params.permit(:name, :open, :rating)
  end
end
