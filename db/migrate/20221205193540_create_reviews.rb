class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :hours_played
      t.integer :boardgame_id
      t.integer :player_id
    end
  end
end
