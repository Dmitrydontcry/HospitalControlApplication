class ApplicationController < ActionController::Base
    before_action do
        I18n.locale = :ru # Or whatever logic you use to choose.
    end


    def is_admin?
      current_user.role == 'admin'
    end
end
