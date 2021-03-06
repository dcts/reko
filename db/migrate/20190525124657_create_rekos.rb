class CreateRekos < ActiveRecord::Migration[5.2]
  def change
    create_table :rekos do |t|
      # OLD WAY OF CONNECTING USER (= REKO ASKER)
      # t.references :user, foreign_key: true
      # NEW WAY (with alias)
      t.references :receiver, foreign_key: {to_table: :users}

      # name of the teller for the MVP (teller is just a visitor with no reko account)!
      t.string :sender_name
      # eventually we will want to do this:
      # t.references :sender, foreign_key: {to_table: :users}

      # CONTENT IS A POLYMORPHIC ASSOCIATIONS
      # can be an instance of either a movie / podcast / audiobook!
      # read more here: https://guides.rubyonrails.org/association_basics.html#polymorphic-associations
      t.references :recommendable, polymorphic: true, index: true

      # STATE (unseen / )
      t.column :status, :integer, default: 0

      t.timestamps
    end
  end
end
