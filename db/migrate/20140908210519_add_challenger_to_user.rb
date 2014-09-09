class AddChallengerToUser < ActiveRecord::Migration
  def change
    add_column :hangmen, :challenger, :string, default: nil
  end
end
