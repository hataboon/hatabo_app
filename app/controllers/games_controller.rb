class GamesController < ApplicationController
  def start
    @cards = Card.all.shuffle
  end
end
