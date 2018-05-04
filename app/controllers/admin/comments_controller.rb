class Admin::CommentsController < Admin::BaseController
  before_action :load_comment, only: %i(show destroy)
  before_action :load_comments, only: %i(index delete_multiple)
  after_action :load_comments, only: %i(destroy delete_multiple)

  def index
    @comments = Comment.all
  end

  def show; end

  def new; end

  def create; end

  def edit; end

  def update; end

  def remove
    @comment = Comment.find_by id: params[:comment_id]
  end

  def destroy
    @comment.destroy
    load_comments
    flash.now[:success] = t "admin.flash.delete"
  end

 def delete_multiple
    if params[:comment_ids].present?
      @selected_comments = Comment.where(id: params[:comment_ids])
      @selected_comments.each do |selected_comment|
        selected_comment.destroy
      end
      flash[:success] = "Success to delete these records"
    else
      flash[:warning] = "Nothing to delete"
    end
    redirect_to admin_comments_path
  end

  private
  def load_comment
    @comment = Comment.find_by id: params[:id]
  end

  def load_comments
    @comments = Comment.all
  end

  def comment_params
    params.require(:category).permit :product_id, :user_id, :content
  end
end
