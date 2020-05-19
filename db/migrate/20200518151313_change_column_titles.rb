class ChangeColumnTitles < ActiveRecord::Migration[5.2]
  def change
    rename_column:tasks,:task,:content
  end
end
