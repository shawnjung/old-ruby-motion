class SongIndexScreen < PM::TableScreen
  title 'My Favorite Songs'
  stylesheet :main
  searchable placeholder: "Search by name"
  include PM::TableScreen::Sortable

  def on_load
    set_attributes self.view, stylename: :my_style
    default_nav_buttons
  end

  def default_nav_buttons
    set_nav_bar_button :left,  title: 'Edit', action: :edit_songs
    set_nav_bar_button :right, system_item: :add, action: :add_song
  end

  def will_appear
    update_table_data
  end

  def add_song
    finish_editing
    open AddSongScreen.new(nav_bar: true)
  end

  def edit_songs
    view.setEditing true, animated: true
    set_nav_bar_button :left,  title: 'Done', style: :done, action: :finish_editing
  end

  def finish_editing
    view.setEditing false, animated: true
    default_nav_buttons
  end

  def on_cell_deleted(cell)
    puts cell[:arguments][:model]
    cell[:arguments][:model].destroy
    true
  rescue
    false
  end

  def show_song_number(args={})
    output = [args[:model].name]
    args[:model].numbers.each do |number|
      output.push "#{number.platform}: #{number.value}"
    end
    App.alert output.join(' / ')
  end

  def table_data
    App.delegate.current_user.sort_songs
    [{
      title: "",
      cells:
        App.delegate.current_user.songs.to_enum.map do |song|
          {
            title: song.name,
            action: :show_song_number,
            arguments: {model: song},
            editing_style: :delete
          }
        end
    }]
  end

  def on_moving_row(from_index_path, proposed_index_path)
    if from_index_path.indexAtPosition(0) == proposed_index_path.indexAtPosition(0)
      proposed_index_path
    else
      from_index_path
    end
  end

  def on_sort(from_index_path, to_index_path)
    @promotion_table_data.data[0][:cells].each_with_index do |cell, i|
      model = cell[:arguments][:model]
      unless model.position == i
        model.position = i
        model.save
      end
    end
    App.delegate.current_user.sort_songs
  end

end