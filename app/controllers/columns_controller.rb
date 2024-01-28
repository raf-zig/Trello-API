class ColumnsController < ApplicationController
  before_action :authenticate_user!

  #def index
    #render :nothing => true, :status => :ok 
  #end 

  def index
    @columns = Column.all

    respond_to do |format|
      format.json { render :json => @columns }
    end
    #render json: @columns
  end

  def show
    @column = Column.find(params[:id])

    respond_to do |format|
      format.json { render :json => @column }
    end
    #render json: @column
  end

  def create
    @column = Column.new(column_params)

    if @column.save
      render json: @column, status: :created, location: @column
    else
      render json: @column.errors, status: :unprocessable_entity
    end
  end

  def update
    @column = Column.find(params[:id])

    if @column.update(column_params)
      render json: @column
    else
      render json: @column.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @column = Column.find(params[:id])
    @column.destroy
  end

  private
    def column_params
      params.require(:column).permit(:title)
    end
end
