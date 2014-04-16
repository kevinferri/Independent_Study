class AssignmentsController < ApplicationController
  before_action :signed_in_user

  def create
    @assignment = current_user.assignments.build(assignment_params)
    if @assignment.save
      flash[:success] = "Assignment Posted!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def assignment_params
      params.require(:assignment).permit(:title, :description, :class_name, :class_code)
    end
end
