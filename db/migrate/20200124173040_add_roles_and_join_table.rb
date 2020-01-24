class AddRolesAndJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :description
    end

    create_table :roles_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :role, index: true
    end
  end

end
