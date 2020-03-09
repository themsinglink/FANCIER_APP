class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]



  def index
    if params[:q].present?
      @articles = Article.search_by_name_and_color_and_material_and_category(params[:q])
    else
      @articles = Article.all
    end
    @articles = policy_scope(@articles).order(created_at: :desc)
                                       .with_attached_photo
    @favorite = Favorite.new
  end





  def show
    @order = Order.new
    @tags = Tag.all

    authorize @article
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

