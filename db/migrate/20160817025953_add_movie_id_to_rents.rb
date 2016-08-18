class AddMovieIdToRents < ActiveRecord::Migration
  def change
    add_column :rents, :movie_id, :integer
  end
end
