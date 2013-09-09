class AddSongScreen < PM::FormotionScreen
  title 'Add'

  def on_load
    set_nav_bar_button :right, title: 'Save', style: :done, action: :create
    @form = self.form

    @form.on_submit do |form|
      create
    end
  end

  def table_data
    {
      sections: [
        {
          title: 'Song Information',
          rows: [
            {title: 'Name', key: :name, type: :string, placeholder: '바람이 분다'},
            {title: 'TJ Number', key: :tj_number, type: :number, placeholder: '14425'},
            {title: 'KY Number', key: :ky_number, type: :number, placeholder: '69034'}
          ]
        },
        {
          rows: [
            {title: "Save", type: :submit}
          ]
        }
      ]
    }
  end

  def create
    user       = App.delegate.current_user
    position   = user.songs.count
    created_at = Time.now
    data = @form.render
    new_song = Song.new name: data[:name], searchable_name: data[:name], created_at: created_at, updated_at: created_at, position: position
    new_song.save!
    new_song.user = App.delegate.current_user
    new_song.save!

    unless data[:tj_number].empty?
      tj_number = SongNumber.new platform: 'TJ', value: data[:tj_number]
      tj_number.save!
      tj_number.song = new_song
      tj_number.save!
    end

    unless data[:ky_number].empty?
      ky_number = SongNumber.new platform: 'KY', value: data[:ky_number]
      ky_number.save!
      ky_number.song = new_song
      ky_number.save!
    end

    close
  rescue
    new_song.destroy
    App.alert 'Please check your data.'
  end
end