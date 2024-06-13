class GamesController < ApplicationController
  def index
    game_service = SinsuiService.new
    @cards = game_service.cards
  end

  def start
    game_service = SinsuiService.new
    @cards = game_service.cards
  end

  def flip
    first_card = params[:first_card]
    second_card = params[:second_card]

    if first_card && second_card
      if first_card['image_path'] == second_card['image_path']
        render json: { match: true, first_card: first_card, second_card: second_card, back_image: view_context.asset_path('card-back.png') }
      else
        render json: { match: false, first_card: first_card, second_card: second_card, back_image: view_context.asset_path('card-back.png') }
      end
    else
      render json: { error: "Invalid card data", back_image: view_context.asset_path('card-back.png') }, status: :unprocessable_entity
    end
  end
end
