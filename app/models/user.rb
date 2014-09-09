class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :hangmen

  def create_challenges(params)
    @params = params
    @user_ids = []
    @words = []

    @params.each do |param|
      if param[0].include? "person"
        @user_ids << param[1]
      elsif param[0].include? "word"
        @words << param[1]
      end
    end

    counter = 0
    @user_ids.each do |id|
          game = Hangman.new(user_id: id, answer: @words[counter], challenger: self.id)
        game.save
        counter += 1
    end
  end

end
