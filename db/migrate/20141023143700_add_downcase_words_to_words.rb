class AddDowncaseWordsToWords < ActiveRecord::Migration
  def change
    add_column :words, :downcase_words, :string
  end
end
