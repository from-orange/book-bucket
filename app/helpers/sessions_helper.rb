module SessionsHelper

  def sign_in(bucketter)
    remember_token = Bucketter.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    bucketter.update_attribute(:remember_token, Bucketter.encrypt(remember_token))
    self.current_bucketter = bucketter
  end

  def current_bucketter=(bucketter)
    @current_bucketter = bucketter
  end

  def current_bucketter
    remember_token = Bucketter.encrypt(cookies[:remember_token])
    @current_bucketter ||= Bucketter.find_by(remember_token: remember_token)
  end

  def signed_in?
    !current_bucketter.nil?
  end

  def sign_out
    self.current_bucketter = nil
    cookies.delete(:remember_token)
  end
end
