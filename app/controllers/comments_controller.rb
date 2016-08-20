class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params) #This create action will link the comment to the article
    redirect_to article_path(@article)
    #send the user back to the show action of the articles controller  
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
