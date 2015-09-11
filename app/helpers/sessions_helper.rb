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

  def signed_in_bucketter
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "please sign in" unless signed_in?
    end
  end

  def current_bucketter?(bucketter)
    bucketter == current_bucketter
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to]||default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end
end
