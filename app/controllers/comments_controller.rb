class CommentsController < ApplicationController
  #event = Event.find(params[:id])
  #if event.user_id == current_user.id
    #event.destroy
  #else
    #redirect_to :root, :notice => "You do not have permissions."
  #end

  before_action :authenticate_user!

  def index
    @comments = Comment.all

    respond_to do |format|
      format.json { render :json => @comments }
    end
    #render json: @comments
  end

  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.json { render :json => @comment }
    end
    #render json: @comment
  end

  def create
    @user = current_user
    @comment = @user.comments.create(comment_params)
    
    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(column_params) && @comment.user_id == current_user.id
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:description)
    end
end
