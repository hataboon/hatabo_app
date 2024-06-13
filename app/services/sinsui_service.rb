class SinsuiService
  attr_reader :cards

  def initialize
    @cards = []
    load_cards
    shuffle_cards
    #card_pairs
  end

  private

  def load_cards
    player_images = Dir.glob(Rails.root.join('app/assets/images/nba/*.png'))
    player_images.each do |image_path|
      name = File.basename(image_path, '.png')
      2.times do
        @cards << PlayerCard.new(name,"#{name}.png")
      end
    end
  end

  def shuffle_cards
    @cards.shuffle!
  end

  # def card_pairs
    # @cards.each do
  # end
end