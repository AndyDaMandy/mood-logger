class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
       user_moods_path(current_user)
    end
    def after_sign_out_path_for(resource)
        root_path
    end
end
