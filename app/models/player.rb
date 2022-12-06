class Player < ActiveRecord::Base
    has_many :reviews
    has_many :boardgames, through: :reviews

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def favorite_game 
        self.boardgames.where(reviews: self.reviews.max_by{|r| r.hours_played})
    end

    def add_review(content, hours_played, boardgame)
        self.reviews.create(content: content, hours_played: hours_played, boardgame: boardgame)
    end

    def play_game(boardgame)
        self.reviews.where(boardgame: boardgame).map{|r| r.update(hours_played: r.hours_played + 1)}
    end
end
