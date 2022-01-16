class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @attempt = Attempt.find_or_create_by(game: @game, user: current_user)
    @grid = populate_grid(@attempt)
    # flash[:notice] = "You earned #{@attempt.points} points!" if @attempt.finished
  end
end
