class SessionsController < ApplicationController

  def new
  end

  def create
    bucketter = Bucketter.find_by(email: params[:session][:email].downcase)
    if bucketter && bucketter.authenticate(params[:session][:password])
      sign_in bucketter
      redirect_to bucketter
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
