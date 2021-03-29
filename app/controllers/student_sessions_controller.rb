class StudentSessionsController < ApplicationController
  include TeacherSessionsHelper

  def new
  end

  def create
    @student = Student.find_by(email: params[:email])

    if @student && @student.authenticate(params[:password])
      log_in(@student)
      redirect_to student_path @student.id
    else
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
