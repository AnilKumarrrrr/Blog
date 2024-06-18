class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    @user.activation_token = User.new_token
    @user.update_attribute(:activation_digest, User.digest(@user.activation_token))
    mail to: user.email, subject: "Account activation"
  end


  def password_reset(user)
    @user = user
    @user.reset_token = User.new_token
    @user.update_attribute(:reset_digest, User.digest(@user.reset_token))
    mail to: user.email, subject: "Password reset"
  end

end
