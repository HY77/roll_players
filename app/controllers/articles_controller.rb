class ArticlesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @article = Article.new
    @article.build_player_image
    @article.build_player
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to current_user
      flash[:success] = "記事を作成しました。"
    else
      render "new"
    end
  end

  private
    def article_params
      params.require(:article).permit(
        :article_title, :content,
        player_image_attributes: [:image],
        player_attributes: [
          :player_name, :team_name, :country, :position,
          :height, :weight
        ]
      )
    end
end
