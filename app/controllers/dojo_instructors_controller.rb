class DojoInstructorsController < ApplicationController
  def index
    @dojo = Dojo.find(params[:id])
    @instructors = @dojo.instructors
  end

  def new
    @dojo = Dojo.find(params[:id])
  end

  def create
    @dojo = Dojo.find(params[:id])
    @instructor = @dojo.instructors.create!(instructor_params)

    redirect_to "/dojos/#{@dojo.id}/instructors"
  end

  private 
  def instructor_params
    params.permit(:name, :payroll, :experience)
  end
end
