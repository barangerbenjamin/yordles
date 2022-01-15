class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new ]

  def show
    @game = current_user.games.last
  end

  private

  def generate_word

  end
end
