class InvitationsController < Devise::InvitationsController
  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:invite) {|u| u.permit(:email, user_attributes: [:name])}
  end

  def new
    self.resource = resource_class.new
    @user = account_company.users.where(id: params["user_id"]).first if params["user_id"]
    if @user
      self.resource.user = @user
      self.resource.email = @user.contact_email
    else
      self.resource.build_user
    end
    render :new
  end

  def create
    user_id = params["account"]["user_attributes"].delete("id")
    if user_id and @user = account_company.users.without_account.where(id: user_id).first
      params["account"]['email'] = @user.contact_email
    end
    super
  end

  protected

  def invite_resource
    resource_class.invite!(invite_params, current_inviter) do |invitable|
      if @user
        invitable.user = @user
      else
        invitable.user.company = current_inviter.user.company
      end
      invitable.valid?
      invitable.errors[:email] = t("devise.invitations.user.errors.account_already_confirmed") if invitable.confirmed?
    end
  end

end

