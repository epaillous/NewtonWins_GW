class ArticlesController < ApplicationController

  def index
    @articles = Article.published.order('date DESC')
    render json: @articles, root: 'articles'
  end
end
