class ColumnsController < ApplicationController
  before_action :authenticate_user!

  def index
    @columns = Column.all
    render json: @columns
  end

  def show
    @column = Column.find(params[:id])
    render json: @column
  end

  def create
    @user = current_user
    @column = @user.columns.create(column_params)

    if @column.save
      render json: @column, status: :created, location: @column
    else
      render json: @column.errors, status: :unprocessable_entity
    end
  end

  def update
    @column = Column.find(params[:id])

    if @column.update(column_params) && @column.user_id == current_user.id
      render json: @column
    else
      render json: @column.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @column = Column.find(params[:id])
    if @column.user_id == current_user.id
      @column.destroy
    end
  end

  private
    def column_params
      params.require(:column).permit(:title)
    end
end
