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

    if @student.save
      log_in(@student)
      redirect_to 
    else
    end
  end

  private

    def student_params
      params.require(:student).permit(:name, :email, :password, :password_confirmation,:school)
    end
end
