class CommentsController < ApplicationController
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
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(column_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:description)
    end
end
