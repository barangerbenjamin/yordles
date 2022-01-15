class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @attempt = Attempt.find_or_create_by(game: @game, user: current_user)
    empty = 6 - @attempt.words.size
    @grid = @attempt.words.map(&:chars) + [["", "", "", "", ""]] * empty

    @game_state = {
      finished: @attempt.words.include?(@game.word) || @attempt.words.size >= 6,
      solved: @attempt.words.include?(@game.word)
    }
  end
end
