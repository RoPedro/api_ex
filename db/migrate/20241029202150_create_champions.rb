class CreateChampions < ActiveRecord::Migration[7.2]
  def change
    create_table :champions do |t|
      t.string :name
      t.string :title

      t.timestamps
    end
  end
end
