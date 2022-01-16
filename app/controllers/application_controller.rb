class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def populate_grid(attempt)
    empty = 6 - attempt.words.size
    grid = attempt.words.map(&:chars) + [["", "", "", "", ""]] * empty
    grid
  end
end
