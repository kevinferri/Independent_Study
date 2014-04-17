class AssignmentsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create]

  def index
    @assignments = Assignment.paginate(page: params[:page])
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = current_user.assignments.build(assignment_params)
    if @assignment.save
      flash[:success] = "Assignment Posted!"
      redirect_to @assignment
    else
      render 'static_pages/home'
    end
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def destroy
  end

  private

    def assignment_params
      params.require(:assignment).permit(:title, :description, :class_name, :class_code)
    end
end
