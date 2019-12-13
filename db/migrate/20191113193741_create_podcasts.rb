class CreatePodcasts < ActiveRecord::Migration[5.2]
  def change
    create_table :podcasts do |t|
      t.string :name, null: false
      t.string :author, default: ''
      t.string :rsslink, unique: true, null: false

      t.timestamps
    end
  end
end
