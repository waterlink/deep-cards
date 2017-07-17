class CreateUserStories < ActiveRecord::Migration[5.1]
  def change
    create_table :user_stories do |t|
      t.string :persona
      t.string :goal
      t.string :reason

      t.timestamps
    end
  end
end
