module PM::TableScreen
  module Sortable
    def tableView(table_view, canMoveRowAtIndexPath:index_path)
      can_move_row? index_path
    end

    def can_move_row? (index_path)
      true
    end

    def tableView(table_view, targetIndexPathForMoveFromRowAtIndexPath:from_index_path, toProposedIndexPath:proposed_index_path)
      on_moving_row from_index_path, proposed_index_path
    end

    def on_moving_row(from_index_path, proposed_index_path)
      proposed_index_path
    end

    def tableView(table_view, moveRowAtIndexPath:from_index_path, toIndexPath:to_index_path)
      original_path = from_index_path.to_a
      new_path = to_index_path.to_a
      section = @promotion_table_data.data[original_path[0]][:cells]

      original_item = section[original_path[1]]
      section.delete original_item
      section.insert new_path[1], original_item
      on_sort from_index_path, to_index_path
    end

    def on_sort(from_index_path, to_index_path)

    end
  end

end