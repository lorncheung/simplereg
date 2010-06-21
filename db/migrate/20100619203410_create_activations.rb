class CreateActivations < ActiveRecord::Migration
  def self.up
    create_table :activations do |t|
      t.string :email, :limit => 100
      t.string :activation_code, :limit => 40
      t.string :activated_at, :datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :activations
  end
end
