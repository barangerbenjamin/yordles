class AttemptsController < ApplicationController
    def update
      @attempt = Attempt.find(params[:id])
      @attempt.update(words: params[:attempt][:words].split(","))
      redirect_to game_path(@attempt.game)
    end
  end
