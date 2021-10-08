class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        case resource
        when User
            mypages_path
        when Admin
            managements_path
        end
      end
end
