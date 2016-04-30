class AddPrivateFieldToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :private, :boolean, default: false
  end
end
