class ArticlesController < ApplicationController
   def index 
    @articles = Article.all
   end
   def show
      @article = Article.find(params[:id])
   end
   def new
      @article = Article.new
   end
   def create
      @article=Article.new(article_params)#Article class Articild in models\article.rb
      @article.save

      redirect_to @article
      #render plain: params[:article].inspect
   end
   private
      def article_params
         params.require(:article).permit(:title,:text)
      end
end
