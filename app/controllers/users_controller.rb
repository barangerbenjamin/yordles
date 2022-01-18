class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @unsolved = @user.attempts.where(finished: false)
      .where.not(solved: true).select { |attempt| attempt.words.any? }.first(3)
  end
end
