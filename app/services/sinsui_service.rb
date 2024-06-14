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
    player_images = Dir.glob(Rails.root.join('app/assets/images/nba/*.{png,jpg}'))
    player_images.each do |image_path|
      name = File.basename(image_path, '.*')
      extension = File.extname(image_path)
      2.times do
        @cards << { name: name, image_path: "#{name}#{extension}" }
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