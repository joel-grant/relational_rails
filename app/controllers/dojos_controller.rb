class DojosController < ApplicationController
  def index
    @dojos = Dojo.all.order(:created_at)
  end

  def show
    @dojo = Dojo.find(params[:id])
  end
end
