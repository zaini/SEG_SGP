class PagesController < ApplicationController
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
