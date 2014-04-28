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

  def edit
    @assignment = Assignment.find(params[:id])
  end

  def update
    @assignment = Assignment.find(params["id"])
    if @assignment.update_attributes(assignment_params)
      flash[:success] = "Assignment updated"
      redirect_to @assignment
    else
      render 'edit'
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @user = User.find(params["id"])
    @assignment.destroy
    flash[:success] = "Assignment deleted."
    redirect_to @user
  end

  private

    def assignment_params
      params.require(:assignment).permit(:title, :description, :class_name, :class_code)
    end
end
