class ArticlesController < ApplicationController
	before_action :find_article, only: [:show, :edit, :update, :destroy]
	def  index
		@articles = Article.all.order(title: :asc)
	end

	def create
		@article = Article.new(set_params)
		@article.save
		redirect_to article_path(@article)
	end

	def new
		@article = Article.new
	end

	def edit
		
	end

	def show
		
	end

	def update
		@article.update(set_params)
		redirect_to article_path(@article)
	end

	def destroy
		@article.destroy
		redirect_to articles_path
	end

	private

	def find_article
		@article = Article.find(params[:id])
		
	end

	def set_params
		params.require(:article).permit(:title, :content)	
	end
end
