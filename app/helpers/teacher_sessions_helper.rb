module TeacherSessionsHelper

  def log_in(teacher)
    session[:teacher_id] = teacher.id
  end

  def current_user
    if session[:teacher_id]
      @current_teacher ||= Teacher.find(session[:teacher_id])
    else session[:parent_id]
    end
  end

  def logged_in?
    if session[:teacher_id]
      !!session[:teacher_id]
    end
  end

  def log_out
    if session[:teacher_id] #&& params[:controller] == "teacher_sessions"
      session[:teacher_id] = nil
    end
  end
end
