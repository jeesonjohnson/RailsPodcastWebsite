class AddExtraPodcastIdentifiers < ActiveRecord::Migration[5.2]
  def change
    add_column :podcasts, :image_url, :text, null: false, default: ""
    add_column :podcasts, :itunes_id, :text, unique: true, null: false,default: ""
  end
end
