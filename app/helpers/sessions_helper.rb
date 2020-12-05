module SessionsHelper
    def login(user, isAdmin)
        logout
        session[:user_id] = user.id
        session[:isAdmin] = isAdmin
    end

    def current_user
        if session[:user_id]
            if session[:isAdmin]
                Admin.find(session[:user_id])
            else
                User.find(session[:user_id])
            end
        end
    end

    def logged_in?
        !current_user.nil?
    end

    def is_admin?
        session[:isAdmin]
    end

    def logout
        session.delete(:user_id)
    end
end
