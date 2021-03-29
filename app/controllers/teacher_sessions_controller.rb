class TeacherSessionsController < ApplicationController
  include TeacherSessionsHelper

  def new
  end

  def create
    @teacher = Teacher.find_by(email: params[:email])

    if @teacher && @teacher.authenticate(params[:password])
      log_in(@teacher)
      redirect_to teacher_path @teacher.id
    else
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
