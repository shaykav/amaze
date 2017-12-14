class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :body
      t.belongs_to :reviewable, polymorphic: true

      t.timestamps
    end
    add_index :reviews, [:reviewable_id, :reviewable_type]
  end
end
