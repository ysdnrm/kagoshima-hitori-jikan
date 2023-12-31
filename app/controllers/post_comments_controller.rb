class PostCommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = @post.id
    flash[:notice] = if comment.save
                       'コメントの投稿に成功しました！'
                     else
                       'コメントの投稿に失敗しました。'
                     end
    redirect_to post_path(@post)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    @post = Post.find(params[:post_id])
    render :post_comments
  end

  private

    def post_comment_params
      params.require(:post_comment).permit(:comment)
    end
end
