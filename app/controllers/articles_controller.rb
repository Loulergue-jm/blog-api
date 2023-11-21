class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[create update destroy]
  before_action :set_article, only: %i[show update destroy]

  # GET /articles
  def index
    @articles = Article.all

    render json: @articles
  end

  # GET /articles/1
  def show
    render json: @article
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    @article.user = current_user  # Associer l'article à l'utilisateur actuel

    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.user == current_user  # Vérifier si l'utilisateur actuel est le propriétaire de l'article
      if @article.update(article_params)
        render json: @article
      else
        render json: @article.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  # DELETE /articles/1
  def destroy
    if @article.user == current_user  # Vérifier si l'utilisateur actuel est le propriétaire de l'article
      @article.destroy
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content)
    end
end
