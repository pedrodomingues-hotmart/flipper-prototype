class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    execute <<-SQL
      CREATE TYPE roles AS ENUM ('user', 'admin', 'vip');
    SQL

    create_table :users do |t|
      t.string :name
      t.column :role, :roles, null: false, default: 'user'

      t.timestamps
    end
  end
end
