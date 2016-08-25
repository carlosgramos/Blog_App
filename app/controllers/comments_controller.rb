class CommentsController < ApplicationController
  http_basic_authenticate_with name: 'dhh', password: 'secret', only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params) #This create action will link the comment to the article
    redirect_to article_path(@article)
    #send the user back to the show action of the articles controller
  end

  #Search for the Article with article_id 'x'
  #Find the comments associated to that article and
  #load them into @comment
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
