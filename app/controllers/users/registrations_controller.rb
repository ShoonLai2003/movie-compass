class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    mypage_path
  end

  def after_update_path_for(resource)
    mypage_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_registration_path
  end
end