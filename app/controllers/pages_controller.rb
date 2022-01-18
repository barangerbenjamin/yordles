class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @game = (Game.all - current_user.games).first
    redirect_to game_path(@game)
  end
end
