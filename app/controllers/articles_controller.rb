class ArticlesController < ApplicationController
  def index
    @articles = Article.order(:published_at).page(params[:page])
  end

  def show
    @article = Article.find(params[ :id])
  end

  def create 
    @article = Article.new(params.require( :article).permit( :title, :content, :author, :category, :published_at))
    if
      @article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end
   
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[ :id])
  end

  def update 
    @article = Article.find(params[ :id])
    if @article.update(params.require( :article).permit( :title, :content, :author, :category, :published_at))
      redirect_to articles_path
    else
      render 'edit'
    end
  end

 
  def destroy
    @article = Article.find(params[ :id])
    @article.destroy

    redirect_to articles_path
  end

end

