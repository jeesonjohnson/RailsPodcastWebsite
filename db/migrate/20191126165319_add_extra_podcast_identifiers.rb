class AddExtraPodcastIdentifiers < ActiveRecord::Migration[5.2]
  def change
    add_column :podcasts, :image_url, :text
    add_column :podcasts, :itunes_id, :text

  end
end
