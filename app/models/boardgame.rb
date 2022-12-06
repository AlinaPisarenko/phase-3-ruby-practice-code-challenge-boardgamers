class Boardgame < ActiveRecord::Base
    has_many :reviews
    has_many :players, through: :reviews

    # Boardgame.oldest
    # returns one boardgame instance for the boardgame that has the earliest year
    def self.oldest
        Boardgame.all.min_by{|g| g.year_released}
    end


    # Boardgame#all_full_reviews
    # returns a new array of strings for each of the boardgame's reviews formatted like so:
    # Review for {insert boardgame name} by {insert player name}: {insert review content}.
    def all_full_reviews
        self.reviews.map{ |r| "Review for #{self.name} by #{r.player.first_name}: #{r.content}."}
    end


end
