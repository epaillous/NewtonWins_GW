class ArticlesController < ApplicationController

  def index
    @articles = Article.published.order('date DESC')
    render json: @articles
  end
end
