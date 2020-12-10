module PostsHelper
  attr_reader :posts
  attr_writer :post_name, :author, :so_button, :si_button, :su_button, :msg_class

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end

  def u_signin
    return unless user_signed_in?

    @so_button = link_to 'Sign Out', destroy_user_session_path, method: 'Delete', class: 'btn btn-info'
  end

  def user_si
    if user_signed_in?
      @author = 'Author'
      @posts.each do |post|
        @post_name = post.user.name
      end
    else
      @si_button = link_to 'Sign in', user_session_path, class: 'btn btn-info'
      @su_button = link_to 'Sign Up', new_user_registration_path, class: 'btn btn-primary'
    end
  end
end
