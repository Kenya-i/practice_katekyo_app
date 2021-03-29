class TeacherBoardsController < ApplicationController
  include TeacherSessionsHelper

  def index
    @teacher_boards = TeacherBoard.all.order(create_at: :desc)
  end

  def show
    @teacher_board = TeacherBoard.find(params[:id])
  end

  def new
    @teacher_board = current_user.teacher_boards.build
  end

  def create
    @teacher_board = current_user.teacher_boards.build(teacher_board_params)
    
    if @teacher_board.save
      redirect_to teacher_board_path @teacher_board.id
    else
    end
  end

  def destroy
  end

  private
    
    def teacher_board_params
      params.require(:teacher_board).permit(:price, :title, :content, :subject)
    end
end
