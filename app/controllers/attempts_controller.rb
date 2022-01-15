class AttemptsController < ApplicationController  
    def update
        @attempt = Attempt.find(params[:id])
        @attempt.update(words: params[:attempt][:words].split(","))
    end
  end
  