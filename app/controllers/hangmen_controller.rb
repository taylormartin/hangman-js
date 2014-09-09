class HangmenController < ApplicationController
  before_action :authenticate_user!

  def index
    @hangmen = current_user.hangmen.all
  end

  def show
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

  def challenge
    #currently nothing in this controller
  end

  def create_challenge
    current_user.create_challenges(params)
    redirect_to hangmen_challenge_path, notice: "Challenge made!"
  end

end
