class ArticlesController < ApplicationController
  def index
    @articles=Article.page(params[:page]).per(5)
  end
  def create
    # Book.create title:params[:title]
    @article=Article.new
    @article.title=params[:title]
    @article.content=params[:content]
    @article.save
    redirect_to "/"
  end

  def show
    @article = Article.find(params[:id])
    @commentaires = Commentaire.where(article_id:params[:id]).page(params[:page]).per(5)
  end

  # def update
  #   Article.find(params[:id]).update(
  #     {
  #       title: params[:title],
  #       content: params[:content]
  #     }
  #   )
  #   redirect_to "/#{params[:id]}"
  # end
  
  def destroy
    Article.find(params[:id]).destroy
    Commentaire.where(article_id:params[:id]).each do |commentaire|
      commentaire.destroy
    end
    redirect_to "/"
  end
  def comment
    # Book.create title:params[:title]
    @article = Article.find(params[:id])
    Commentaire.create title: params[:title], content:params[:content] , article_id: @article.id
    @commentaires = Commentaire.where(article_id: @article.id)
    redirect_to "/#{@article.id}"
  end
end
