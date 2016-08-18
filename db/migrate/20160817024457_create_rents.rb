class CreateRents < ActiveRecord::Migration
  def change
    create_table :rents do |t|
      t.datetime :start
      t.date :end

      t.timestamps null: false
    end
  end
end
