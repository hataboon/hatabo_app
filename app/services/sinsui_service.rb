class SinsuiService
  attr_reader :cards

  def initialize
    @cards = []
    load_cards
    shuffle_cards
  end

  private

  def load_cards
    player_images = Dir.glob(Rails.root.join('app/assets/images/nba/*.png'))
    player_images.each_with_index do |image_path,index|
      name = File.basename(image_path, '.png')
      @cards << PlayerCard.new(name,image_path)
    end
  end

  def shuffle_cards
    @cards.shuffle!
  end
end
