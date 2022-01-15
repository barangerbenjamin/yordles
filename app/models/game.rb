class Game < ApplicationRecord
  has_many :attempts

  def next
    Game.where("id > #{self.id}").first
  end

  def previous
    Game.where("id < #{self.id}").first
  end
end
