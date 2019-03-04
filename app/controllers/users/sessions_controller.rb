class Users::SessionsController < Devise::SessionsController

  def new
    @user = User.new
  end

  def create
    @user =  User.find_by(email: params[:user][:email])
    if @user
      if @user.valid_password? params[:user][:password]
        @user =  sign_in("user", User.find_by(email: params[:user][:email]))
        flash[:notice] = "Signed In successfully."      
        redirect_to root_path
      else
        flash[:error] = "Invalid email or password."
        redirect_to new_user_session_path
      end
    else
      flash[:error] = "Invalid email or password."
      redirect_to new_user_session_path
    end  
  end
end
