class CreatePodcasts < ActiveRecord::Migration[5.2]
  def change
    create_table :podcasts do |t|
      t.string :name
      t.string :author
      t.string :rsslink

      t.timestamps
    end
  end
end
