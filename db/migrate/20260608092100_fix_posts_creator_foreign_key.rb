class FixPostsCreatorForeignKey < ActiveRecord::Migration[8.1]
  def up
    if foreign_keys(:posts).any? { |fk| fk.to_table == "creators" }
      remove_foreign_key :posts, :creators
    end
    
    unless foreign_keys(:posts).any? { |fk| fk.to_table == "users" }
      add_foreign_key :posts, :users, column: :creator_id
    end
  end

  def down
    remove_foreign_key :posts, :users, column: :creator_id
    add_foreign_key :posts, :creators, column: :creator_id
  end
end
