# frozen_string_literal: true

module PostsHelper
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
