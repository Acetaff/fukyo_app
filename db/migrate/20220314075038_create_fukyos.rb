class CreateFukyos < ActiveRecord::Migration[6.0]
  def change
    create_table :fukyos do |t|
      t.string     :title,  null: false
      t.text       :f_text, null: false
      t.string     :f_url,  null: false
      t.references :user,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
