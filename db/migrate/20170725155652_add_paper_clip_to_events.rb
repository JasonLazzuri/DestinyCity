class AddPaperClipToEvents < ActiveRecord::Migration[5.1]
  def up
    add_attachment :events, :images
  end

  def down
    remove_attachment :events, :images
  end
end
