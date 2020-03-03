class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /restaurants
  # GET /restaurants.json
  def index

  end

  # GET /articles/1
  # GET /restaurants/1.json
  def show
    authorize @article
  end

  # authorize(@restaurant, show, current_user)

  # def authorize(record, action_name, user)
  #   look for action_name with ?
  #   let user use 'record'

  # end
  # GET /restaurants/new
  def new
    @article = Article.new
    authorize @article
  end

  # GET /restaurants/1/edit
  def edit
    authorize @article
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @article = Article.new(article_params)
    @articles.user = current_user
    authorize @articles
    if @article.save
      redirect_to article_path(@article) #notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    authorize @article
      if @article.update(article_params)
         redirect_to article_path(@article) # notice: 'Restaurant was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @article.destroy
    #respond_to do |format|
     # format.html { redirect_to articles_url, notice: 'Restaurant was successfully destroyed.' }
      #format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:name, :category_id, :color, :size, :material, :shipping_cost, :user_id, :photo, :state, :price_cents)
    end
end
