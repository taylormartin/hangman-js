class HangmenController < ApplicationController
  before_action :authenticate_user!

  def index
    @hangmen = current_user.hangmen.all
  end

  def show
    if params[:cheat]
      raise "Stop it"
    end
    @hangman = current_user.hangmen.find params[:id]
  end

  def create
    hangman = current_user.hangmen.create! answer: Hangman::WORD_LIST.sample
    redirect_to hangman
  end

  def update
    hangman = current_user.hangmen.find params[:id]
    hangman.guess params[:guess] unless hangman.finished?
    redirect_to hangman
  end

  def ajax_test
  end
end
