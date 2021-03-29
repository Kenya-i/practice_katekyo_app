module TeacherSessionsHelper


  private

    CONTROLLER = [ "teacher_sessions",
                  "student_sessions",
                  "parent_sessions"]

    def log_in(user)
      if teacher_controller?
        session[:teacher_id] = user.id
      elsif student_controller?
        session[:student_id] = user.id
      else parent_controller?
        session[:parent_id] = user.id
      end
      # session[:teacher_id] = user.id if teacher_controller?
      # session[:student_id] = user.id if student_controller?
      # session[:parent_id] = user.id if parent_controller?
    end

    def current_user
      if session[:teacher_id]
        @current_teacher ||= Teacher.find(session[:teacher_id])
      elsif session[:student_id]
        @current_student ||= Student.find(session[:student_id])
      else session[:parent_id]
        @current_parent ||= Parent.find(session[:parent_id])
      end
      # @current_teacher ||= Teacher.find(session[:teacher_id]) if session[:teacher_id]
      # @current_student ||= Student.find(session[:student_id]) if session[:student_id]
      # @current_parent ||= Parent.find(session[:parent_id]) if session[:parent_id]
    end

    def current_parent?(parent)
      session[:parent_id] == parent.id
    end

    def logged_in?
      if session[:teacher_id]
        !!session[:teacher_id]
      elsif session[:student_id]
        !!session[:student_id]
      else session[:parent_id]
        !!session[:parent_id]
      end
      # !!session[:teacher_id] if session[:teacher_id]
      # !!session[:student_id] if session[:student_id]
      # !!session[:parent_id] if session[:parent_id]
    end

    def log_out
      session[:teacher_id] = nil if session[:teacher_id]
      session[:student_id] = nil if session[:student_id]
      session[:parent_id] = nil if session[:parent_id]
    end

    def teacher_controller?
      params[:controller] == "teachers" || params[:controller] == "teacher_sessions"
    end

    def student_controller?
      params[:controller] == "students" || params[:controller] == "student_sessions"
    end

    def parent_controller?
      params[:controller] == "parents" || params[:controller] == "parent_sessions"
    end
end
