class Boardgame < ActiveRecord::Base
    has_many :reviews
    has_many :players, through: :reviews

    def self.oldest
        Boardgame.all.min_by{|g| g.year_released}
    end

    def all_full_reviews
        self.reviews.map{ |r| "Review for #{self.name} by #{r.player.first_name}: #{r.content}."}
    end


end
