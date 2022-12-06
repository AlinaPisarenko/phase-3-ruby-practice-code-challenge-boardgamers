class Player < ActiveRecord::Base
    has_many :reviews
    has_many :boardgames, through: :reviews

    # Player#full_name
    # returns the full name of the player, with the first name and the last name concatenated
    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    # Player#favorite_game
    # returns the game that has the highest hours_played amongst this players reviews
    def favorite_game 
        self.boardgames.where(reviews: self.reviews.max_by{|r| r.hours_played})
    end

    # Player#add_review(boardgame, content, hours_played)
    # takes a boardgame (an instance of the Boardgame class), content, and a hours_played
    # creates a new review for the boardgame with the given boardgame_id
    def add_review(content, hours_played, boardgame)
        self.reviews.create(content: content, hours_played: hours_played, boardgame: boardgame)
    end

    # Player#play_game(boardgame)
    # takes a boardgame (an instance of the Boardgame class) and
    # increments the hours_played by 1 for all reviews the player has for this boardgame
    # this is a complex problem so break it down into steps before you proceed
    def play_game(boardgame)
        self.reviews.where(boardgame: boardgame).map{|r| r.update(hours_played: r.hours_played + 1)}
    end
end
