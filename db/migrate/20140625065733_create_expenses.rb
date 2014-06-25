class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :category, null: false
      t.boolean :accounted_for, default: false
    end
  end
end
