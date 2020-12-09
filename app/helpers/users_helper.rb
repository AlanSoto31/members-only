module UsersHelper
  def user_params
    params.require(:user).permit(:name, :password, :email)
  end
end
