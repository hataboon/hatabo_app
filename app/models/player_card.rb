class PlayerCard < ApplicationRecord
  attr_accessor :name, :image_path, :flipped

  def initialize(name, image_path)
    @name = name
    @image_path = image_path
    @flipped = false
  end
end