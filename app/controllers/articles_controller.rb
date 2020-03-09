class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]



  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true).includes(:category, :tags)

    if params[:q_search].present?
      @pg_result = Article.search_by_name_and_color_and_material_and_category(params[:q_search])
    end

    @articles = policy_scope(@articles).order(created_at: :desc)
                                          .with_attached_photo
    @articles = @articles & @pg_result if @pg_result

    if current_user
      @articles  = @articles - current_user.articles
    end
    @favorite = Favorite.new
  end

  def show
    @order = Order.new
    authorize @article

    @user_articles = @article.user
                             .articles
                             .with_attached_photo
  end


  def new
    @article = Article.new
    authorize @article
  end


  def edit
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    authorize @article
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end


  def update
    authorize @article
      if @article.update(article_params)
         redirect_to article_path(@article) # notice: 'Restaurant was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @article.destroy
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:name, :category_id, :color, :size, :material, :shipping_cost, :user_id, :photo, :state, :price_cents)
    end


end

