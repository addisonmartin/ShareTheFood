# frozen_string_literal: true

# Only devise's registration controller is overridden, to make it so user's
# accounts are soft deleted, not permanently deleted.
class Users::RegistrationsController < Devise::RegistrationsController
  # DELETE /resource
  def destroy
    resource.discard! # Discard, instead of deleting, the user's account.
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed
    yield resource if block_given?
    respond_with_navigational(resource) do
      redirect_to after_sign_out_path_for(resource_name)
    end
  end
end
