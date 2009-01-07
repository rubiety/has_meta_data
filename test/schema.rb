ActiveRecord::Schema.define(:version => 0) do
  
  create_table :articles, :force => true do |t|
    t.string :title
    t.text :summary
    t.text :body
    t.date :post_date
  end
  
  create_table :article_meta, :force => true do |t|
    t.references :article
    t.string :reference_link
    t.text :reference_note
  end
  
end