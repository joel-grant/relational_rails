class DojoInstructorsController < ApplicationController
  def index
    dojo = Dojo.find(params[:id])
    @instructors = dojo.instructors
  end
end
