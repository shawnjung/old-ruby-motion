class User < MotionDataWrapper::Model
  def ordered_songs
    songs.sortedArrayUsingDescriptors [sort_by_position_descriptor]
  end

  def sort_songs
    songs.sortUsingDescriptors [sort_by_position_descriptor]
    songs
  end

  def sort_by_position_descriptor
    NSSortDescriptor.alloc.initWithKey:"position", ascending:true
  end
end