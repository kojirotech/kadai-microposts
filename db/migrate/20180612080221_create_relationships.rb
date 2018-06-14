class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.references :follow, foreign_key: { to_table: :users }
      t.references :like, foreign_key: { to_table: :users }

      t.timestamps
      
      t.index [:user_id, :follow_id, :like_id], unique: true
    end
  end
end
