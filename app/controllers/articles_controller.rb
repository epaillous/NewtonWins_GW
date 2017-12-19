class ArticlesController < ApplicationController

  def index
    @articles = Article.published.order('date DESC')
    render json: @articles
  end

  def show
    @article = Article.find(params[:id])
    render json: @article, include: ['point', 'point.city']
  end
end
