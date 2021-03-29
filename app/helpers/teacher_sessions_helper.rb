module TeacherSessionsHelper


  private

    CONTROLLER = [ "teacher_sessions",
                  "student_sessions",
                  "parent_sessions"]
    def log_in(user)
      if params[:controller] == "teacher_sessions"
        session[:teacher_id] = user.id
      elsif params[:controller] == "student_sessions"
        session[:student_id] = user.id
      else params[:controller] == "parent_sessions"
        session[:parent_id] = user.id
      end
    end

    def current_user
      if session[:teacher_id]
        @current_teacher ||= Teacher.find(session[:teacher_id])
      else session[:parent_id]
      end
    end

    def logged_in?
      return !!session[:teacher_id] if session[:teacher_id]
      return !!session[:student_id] if session[:student_id]
      return !!session[:parent_id] if session[:parent_id]
      # if session[:teacher_id]
      #   !!session[:teacher_id]
      # elsif session[:student_id]
      #   !!session[:student_id]
      # else session[:parent_id]
      #   !!session[:parent_id]
      # end
    end

    def log_out
      if session[:teacher_id] #&& params[:controller] == "teacher_sessions"
        session[:teacher_id] = nil
      end
    end
end
