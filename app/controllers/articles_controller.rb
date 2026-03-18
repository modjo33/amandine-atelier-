class ArticlesController < ApplicationController
  def index
    @articles = Article.published.ordered.by_category(params[:category])
    @categories = Article.published.distinct.pluck(:category).compact.sort
    @c = SiteContent.all.index_by(&:key)
  end

  def show
    @article = Article.published.find_by!(slug: params[:slug])
    @related = Article.published.where(category: @article.category).where.not(id: @article.id).ordered.limit(3)
    @c = SiteContent.all.index_by(&:key)
  end
end
