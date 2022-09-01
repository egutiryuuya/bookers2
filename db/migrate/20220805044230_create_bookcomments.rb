class CreateBookcomments < ActiveRecord::Migration[6.1]
  def change
    create_table :bookcomments do |t|
      t.integer :book_id
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
  end
end
