require File.join(File.dirname(__FILE__), 'test_helper')
require File.join(File.dirname(__FILE__), 'models/article')

class ArticleTest < Test::Unit::TestCase
  
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
    
    should "detect correct meta data columns" do
      assert_equal ['reference_link', 'reference_note'], Article.meta_data_columns
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
  
  context "an new article without meta data" do
    setup { @article = Article.new(:title => 'Title', :body => 'Body') }
    
    should "not have meta data" do
      assert !@article.has_meta_data?
    end
    
    should "return nil for meta data fields" do
      assert_nil @article.reference_link
      assert_nil @article.reference_note
    end
  end
  
  context "a new article with meta data" do
    setup { @article = Article.new(:title => 'Title', :body => 'Body', :reference_link => 'http://benhughes.name/') }
    
    should "have meta data" do
      assert @article.has_meta_data?
    end
    
    should "return values for meta data fields" do
      assert_equal 'http://benhughes.name/', @article.reference_link
      assert_nil @article.reference_note
    end
  end
  
  context "a new article after setting meta data fields through mutators" do
    setup do
      @article = Article.new(:title => 'Title', :body => 'Body')
      @article.reference_link = 'http://benhughes.name/'
      @article.reference_note = 'Ben Hughes Author'
    end
    
    should "have meta data" do
      assert @article.has_meta_data?
    end
    
    should "return values for meta data fields" do
      assert_equal 'http://benhughes.name/', @article.reference_link
      assert_equal 'Ben Hughes Author', @article.reference_note
    end
  end
  
end
