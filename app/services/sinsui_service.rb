class SinsuiService
  attr_reader :cards # cards属性を公開

  def initialize
    @cards = [] # cards配列を初期化
    load_cards # カードを読み込む
    select_random_cards # ランダムにカードを選択
    shuffle_cards # カードをシャッフル
  end

  private

  def load_cards
    player_images = Dir.glob(Rails.root.join('app/assets/images/nba/*.{png,jpg}')) # 画像ファイルを取得
    player_images.each do |image_path|
      name = File.basename(image_path, '.*') # 画像のファイル名を取得
      @cards << PlayerCard.new(name, "#{name}#{File.extname(image_path)}") # PlayerCardオブジェクトを作成して配列に追加
    end
  end

  def select_random_cards
    selected_cards = @cards.sample(10)  # 10種類のカードをランダムに選択
    @cards = selected_cards.flat_map { |card| [card, card.clone] }  # それぞれのカードを2枚ずつにする
  end

  def shuffle_cards
    @cards.shuffle! # カードをシャッフル
  end
end
