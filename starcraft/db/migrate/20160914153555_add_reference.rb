class AddReference < ActiveRecord::Migration[5.0]
	add_reference :matches, :winner, references: :players
	add_reference :matches, :loser, references: :players
  def change
  end
end
