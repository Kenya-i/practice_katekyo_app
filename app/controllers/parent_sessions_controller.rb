class ParentSessionsController < ApplicationController
  include TeacherSessionsHelper

  def new
    @parent = Parent.new
  end

  def create
    # debugger
    @parent = Parent.find_by(email: params[:email])

    if @parent && @parent.authenticate(params[:password])
      log_in(@parent)
      redirect_to parent_path @parent.id
    else
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
