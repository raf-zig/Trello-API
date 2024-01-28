class CardsController < ApplicationController
  def index
    @cards = Card.all

    respond_to do |format|
      format.json { render :json => @cards }
    end
    #render json: @cards
  end

  def show
    @card = Card.find(params[:id])

    respond_to do |format|
      format.json { render :json => @card }
    end
    #render json: @card
  end

  def create
    @card = Card.new(card_params)

    if @card.save
      render json: @card, status: :created, location: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  def update
    @card = Card.find(params[:id])

    if @card.update(card_params)
      render json: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
  end

  private
    def card_params
      params.require(:card).permit(:title, :description)
    end
end
