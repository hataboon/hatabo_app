class GamesController < ApplicationController
  def index
    game_service = SinsuiService.new # SinsuiServiceのインスタンスを作成
    @cards = game_service.cards # @cardsインスタンス変数にカードデータを設定
  end

  def start
    game_service = SinsuiService.new # SinsuiServiceのインスタンスを作成
    @cards = game_service.cards # @cardsインスタンス変数にカードデータを設定
  end

  def flip
    first_card = params[:first_card] # パラメータからfirst_cardを取得
    second_card = params[:second_card] # パラメータからsecond_cardを取得

    if first_card && second_card
      if first_card['image_path'] == second_card['image_path'] # 画像パスが一致するか確認
        render json: { match: true, first_card: first_card, second_card: second_card, back_image: view_context.asset_path('card-back.png') } # 一致した場合
      else
        render json: { match: false, first_card: first_card, second_card: second_card, back_image: view_context.asset_path('card-back.png') } # 一致しない場合
      end
    else
      render json: { error: "Invalid card data", back_image: view_context.asset_path('card-back.png') }, status: :unprocessable_entity # カードデータが無効な場合
    end
  end

  # 新しいカードを提供するアクションを追加
  def new_cards
    game_service = SinsuiService.new
    render json: game_service.cards
  end
end
