class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :author, null: false, foreign_key: { to_table: 'users' }
      t.text :text, null: false

      t.timestamps
    end
  end
end
