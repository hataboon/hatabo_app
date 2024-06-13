class PlayerCard
  attr_accessor :name, :image_path, :flipped

  def initialize(name, image_path)
    @name = name
    @image_path = image_path
  end

  def to_join(*_args)
    { name: @name, image: "/assets/nba/#{@image_path}"}.to_join
  end
end