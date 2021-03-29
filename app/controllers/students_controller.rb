class StudentsController < ApplicationController
  include TeacherSessionsHelper

  def new
    @student = Student.new
  end

  def show
    @student = Student.find(params[:id])
  end

  def create
    @parent = Parent.find_by(email: student_params[:parent_email])
    student = Student.new(student_params)
    @student = Student.new(
      name: student.name,
      email: student.email,
      password: student.password,
      password_confirmation: student.password_confirmation,
      school: student.school,
      parent_email: student.parent_email,
      parent_id: @parent.id)

    if @student.save
      log_in(@student)
      redirect_to student_path(@student.id)
    else
      render :new
    end
  end

  private

    def student_params
      params.require(:student).permit(:name, :email, :password, :password_confirmation,:school, :parent_email)
    end
end
