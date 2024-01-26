class CreateJoinTableColumnsCards < ActiveRecord::Migration[7.0]
  def change
    create_join_table :columns, :cards do |t|
      t.index :column_id
      t.index :card_id
    end
  end
end
