class ParentsController < ApplicationController
  include TeacherSessionsHelper

  def new
    @parent = Parent.new
  end

  def show
    @parent = Parent.find(params[:id])
  end

  def create
    @parent = Parent.new(parent_params)

    if @parent.save
      log_in(@parent)
      redirect_to parent_path @parent.id
    else
      render :new
    end
  end

  private

    def parent_params
      params.require(:parent).permit(:name, :email, :password, :password_confirmation)
    end
end
