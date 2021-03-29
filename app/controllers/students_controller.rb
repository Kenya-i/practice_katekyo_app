class StudentsController < ApplicationController
  include TeacherSessionsHelper

  def new
    @student = Student.new
  end

  def show
    debugger
  end

  def create
    @student = Student.new(student_params)
    @parent = Parent.find_by(email: student_params[:parent_email])
    # debugger
    if @student.save
      log_in(@student)
      redirect_to 
    else
      render :new
    end
  end

  private

    def student_params
      params.require(:student).permit(:name, :email, :password, :password_confirmation,:school, :parent_email)
    end
end
