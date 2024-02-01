class CardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cards = Card.all
    render json: @cards
  end

  def show
    @card = Card.find(params[:id])
    render json: @card
  end

  def create
    @user = current_user
    @card = @user.cards.create(card_params)

    if @card.save
      render json: @card, status: :created, location: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  def update
    @card = Card.find(params[:id])

    if @card.update(card_params) && @card.user_id == current_user.id
      render json: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @card = Card.find(params[:id])
    if @card.user_id == current_user.id
      @card.destroy
    end
  end

  private
    def card_params
      params.require(:card).permit(:title, :description)
    end
end
