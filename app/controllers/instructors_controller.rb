class InstructorsController < ApplicationController
  def index
    @instructors = Instructor.all
  end

  def show
    @instructor = Instructor.find(params[:id])
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    instructor = Instructor.find(params[:id])
    instructor.update(instructor_params)

    redirect_to "/instructors/#{instructor.id}"
  end

  def destroy
    instructor = Instructor.find(params[:id])
    instructor.destroy
    redirect_to "/instructors"
  end

  private
  def instructor_params
    params.permit(:name, :payroll, :experience)
  end
end
