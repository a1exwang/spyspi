class Start < ActiveRecord::Migration

  def change
    create_table :artists do |t|
      t.string  :name
      t.string  :name_eng
      t.string  :name_jp
      t.string  :height
      t.datetime  :birthday
      t.string  :cup
      t.integer :bust
      t.integer :waistline
      t.integer :hip

      t.timestamps null: false
    end

    create_table :films do |t|
      t.integer :designation_id
      t.string  :title
      t.integer :company_id
      t.integer :artist_id
      t.text    :description
      t.date    :production_date
      t.integer :length # by minutes

      t.timestamps null: false
    end

    create_table :series do |t|
      t.string  :name
      t.integer :company_id
      t.text    :description
    end

    create_table :designations do |t|
      t.integer :series_id
      t.string  :name
    end

    create_table :companies do |t|
      t.string  :name
    end

    # film tags
    create_table :tags do |t|
      t.string  :content
    end
    create_table :films_tags do |t|
      t.integer :tag_id
      t.integer :film_id
    end

    # download links
    create_table :links do |t|
      t.string  :type
      t.integer :real_id
      t.integer :film_id
      t.integer :downloaded_times
      t.timestamps null: false
    end

    create_table :ed2k_links do |t|
      t.string  :link
    end
    create_table :magnet_links do |t|
      t.string  :link
    end
    create_table :bt_links do |t|
      t.string  :torrent_file_path
    end
    create_table :file_links do |t|
      t.string  :path
    end
  end
end
