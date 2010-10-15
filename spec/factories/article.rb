require "factory_girl"

Factory.define(:article) do |f|
  f.title { Faker::Lorem.sentence }
  f.body { Faker::Lorem.paragraphs.join("\n\n") }
end

Factory.define(:article_meta, :class => Article::Meta) do |f|
  f.association(:article)
  f.reference_link { "http://" + Faker::Internet.domain_name }
  f.reference_note { Faker::Lorem.paragraph }
end

Factory.define(:article_with_meta_data, :parent => :article) do |f|
  f.association(:meta, :factory => :article_meta)
end
