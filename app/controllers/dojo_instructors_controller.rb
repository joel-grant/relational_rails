class DojoInstructorsController < ApplicationController
  def index
    @dojo = Dojo.find(params[:id])
    if params[:order]
      @instructors = @dojo.instructors.alphabetize(params[:id])
    elsif params[:experience]
      @instructors = @dojo.instructors.filter_threshold(params[:experience])
    else
      @instructors = @dojo.instructors
    end

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
