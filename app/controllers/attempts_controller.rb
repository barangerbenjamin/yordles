class AttemptsController < ApplicationController
    def update
      @attempt = Attempt.find(params[:id])
      words = params[:attempt][:words].split(",")

      game_check = {
        finished: @attempt.words.size == 5 || @attempt.game.word.downcase == words.last.downcase,
        solved: @attempt.words.include?(@attempt.game.word)
      }
      if @attempt.words.size == 5 || @attempt.game.word.downcase == words.last.downcase
        @attempt.update({ words: words }.merge(game_check).merge(points: 100 - @attempt.words.size * 20))
      else
        @attempt.update({ words: words }.merge(game_check))
      end
      @grid = populate_grid(@attempt)
      @game =  @attempt.game
    end
  end
