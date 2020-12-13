class PagesController < ApplicationController
    def admin
        if logged_in? && is_admin?
            redirect_to(admin_panel_path)
        else
            redirect_to(admin_login_path)
        end
    end

    def admin_panel
        unless logged_in? && is_admin?
            redirect_to(root_path)
        end
    end

    def account
        unless logged_in? && !is_admin?
            redirect_to(root_path)
        end
    end
end
