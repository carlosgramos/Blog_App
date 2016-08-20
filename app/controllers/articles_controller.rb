class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id]) #This is the show action called by articles_new. It will return the created article.
  end                                    #This instance variable is passed to the view.

  def new
    @article = Article.new #this will return true or false, based upon the active record validations implemented in Article Model
  end
  # The reason why we added @article = Article.new in the ArticlesController is that otherwise @article would be
  # nil in our view, and calling @article.errors.any? would throw an error.

  def edit
    @article = Article.find(params[:id])

    if @article.update(article_params) #if @article meets the params required, update it
      redirect_to @article
    else
      render 'edit' #else, render the edit view again! The params come from the form fields in articles/edit.html
    end

  end


  def create
    #render plain: params[:article].inspect => use this command to print output to the browser
    @article = Article.new(article_params)#the private method article_params is called, and returns the params from the form
    #a new instance is created with the attributes captured by the form_for articles from the article_new form
    if @article.save #the instance is saved in the database. Also notice if/else statement from validation
      redirect_to article_url(@article) #the user is redirected to the article_show view so he can see the save confirmation
      #above line can be refactored to redirect_to @article
    else
      render 'new'
      #The render method is used so that the @article object is passed back to the new template when it is rendered.
      # This rendering is done within the same request as the form submission
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
    #Redirects the browser to the target specified in options, in this case the index action
  end

  private
  def article_params #article_params = made private for security and reusability among the controller methods that
    params.require(:article).permit(:title, :text)#require parameters
  end

end
