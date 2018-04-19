class Admin::CommentsController < Admin::BaseController
  before_action :load_comment, only: %i(show destroy)

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find_by id: params[:id]
  end

  def new; end

  def create; end

  def edit; end

  def update; end

  def remove
    @comment = Comment.find_by id: params[:comment_id]
  end

  def destroy
    @comment.destroy
    @comments = Comment.all
  end

  private
  def load_comment
    @comment = Comment.find_by id: params[:id]
  end

  def comment_params
    params.require(:category).permit :product_id, :user_id, :content
  end
end
