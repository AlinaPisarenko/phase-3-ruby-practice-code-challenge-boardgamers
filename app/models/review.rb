class Review < ActiveRecord::Base
    belongs_to :boardgame
    belongs_to :player

    # Review#full_review
    # should return a string formatted as follows:
    # Review for {insert boardgame name} by {insert player name}: {insert review content}.
    def full_review
        "Review for #{self.boardgame.name} by #{self.player.first_name} #{self.player.last_name}: #{self.content}"
    end
end