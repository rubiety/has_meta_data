require File.join(File.dirname(__FILE__), 'test_helper')
require File.join(File.dirname(__FILE__), 'models/article')

class ArticleTest < Test::Unit::TestCase
  fixtures :articles, :article_meta
  set_fixture_class :article_meta => Article::Meta
  
  context "Article model" do
    should_have_one :meta
    should_have_named_scope :with_meta
    should_have_named_scope :without_meta
    
    should_have_class_methods :meta_data_class_name, :meta_data_foreign_key, :meta_data_table_name
    
    should "default class name to Meta" do
      assert_equal "Meta", Article.meta_data_class_name
    end
    
    should "expose meta class constant" do
      assert_equal Article::Meta, Article.meta_data_class
    end
    
    should "default foreign key to article_id" do
      assert_equal "article_id", Article.meta_data_foreign_key
    end
    
    should "default table name to article_meta" do
      assert_equal "article_meta", Article.meta_data_table_name
    end
    
    context "Meta model" do
      should "have a be defined under Article" do
        assert Article.constants.include?('Meta')
      end
      
      should "load" do
        assert_nothing_raised do
          Article::Meta
        end
      end
      
      should "expose original class name of Article" do
        assert_equal Article, Article::Meta.original_class
      end
    end
  end
  
  context "an article" do
    setup { @article = articles(:article_without_meta) }
        
  end
  
end
