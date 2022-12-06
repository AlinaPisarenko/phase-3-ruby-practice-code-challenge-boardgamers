class Review < ActiveRecord::Base
    belongs_to :boardgame
    belongs_to :player

    def full_review
        "Review for #{self.boardgame.name} by #{self.player.first_name} #{self.player.last_name}: #{self.content}"
    end
end