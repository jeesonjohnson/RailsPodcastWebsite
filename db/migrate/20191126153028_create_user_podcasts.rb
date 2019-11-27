class CreateUserPodcasts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_podcasts do |t|
      t.references :user, index: true, foreign_key: true
      t.references :podcast, index: true, foreign_key: true

      t.timestamps
    end
  end
end
