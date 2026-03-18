class Admin::ArticlesController < ApplicationController
  before_action :authenticate_admin!
  layout "admin"
  before_action :set_article, only: %i[edit update destroy send_newsletter]

  def index
    @articles = Article.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to admin_articles_path, notice: "Article créé."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to admin_articles_path, notice: "Article mis à jour."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_path, notice: "Article supprimé."
  end

  def send_newsletter
    recipients = Contact.newsletter_subscribers
    count = 0
    recipients.find_each do |contact|
      NewsletterMailer.send_article(contact, @article).deliver_later
      count += 1
    end
    redirect_to admin_articles_path, notice: "Newsletter envoyée à #{count} contact#{'s' if count > 1}."
  end

  private

  def set_article
    @article = Article.find_by!(slug: params[:id]) rescue Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :slug, :content, :excerpt, :meta_description, :category, :published, :published_at, :cover_image)
  end
end
