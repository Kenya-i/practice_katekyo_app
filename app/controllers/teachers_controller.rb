class TeachersController < ApplicationController
  include TeacherSessionsHelper


  def index
  end

  def show
    @teacher = Teacher.find(params[:id])
    @teacher_boards = @teacher.teacher_boards.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    
    if @teacher.save
      log_in(@teacher)
      redirect_to teacher_path @teacher.id
    else
      render :new
    end
  end

  
  
  private
  
  def teacher_params
    params.require(:teacher).permit(:name, :email, :password, :password_confirmation, :school, :self_introduction)
  end
end
