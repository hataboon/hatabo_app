class GamesController < ApplicationController
  def start
    game_service = SinsuiService.new
    @cards = game_service.cards
  end
end
