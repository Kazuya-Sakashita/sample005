class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def after_sign_in_path_for(resource)
        case resource
        when User
            mypages_path
        when Admin
            managements_path
        end
    end

    # ログイン済ユーザーのみにアクセスを許可する
    before_action :authenticate_user!

    # deviseコントローラーにストロングパラメータを追加する          
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
        # アカウント編集の時にnameとprofileのストロングパラメータを追加
        devise_parameter_sanitizer.permit(:account_update, keys: [
            :name,
            :phone_number,
            :skills,
            :skill_level,
            :github_url,
            :account_info,
            :unit_price,
            :unit
            ])
    end

    
end
