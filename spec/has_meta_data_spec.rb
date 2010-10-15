require "spec_helper"

describe HasMetaData do
  context "Article model" do
    it "should expose #meta_data_class_name as Meta" do
      Article.meta_data_class_name.should == "Meta"
    end
    
    it "should expose #meta_data_class as Article::Meta" do
      Article.meta_data_class.should == Article::Meta
    end
    
    it "should default #meta_data_foreign_key to article_id" do
      Article.meta_data_foreign_key.should == "article_id"
    end
    
    it "should find #meta_data_columns" do
      Article.meta_data_columns.should == ["reference_link", "reference_note"]
    end
    
    context "Meta model" do
      it "should be defined under the Article namespace" do
        Article.constants.should include('Meta')
      end
      
      it "should expose #original_class as Article" do
        Article::Meta.original_class.should == Article
      end
    end
  end
  
  context "with an article without meta data" do
    before { @article = Factory.create(:article) }
    
    it "should not have meta data" do
      @article.should_not have_meta_data
    end
    
    it "should return nil for meta data fields" do
      @article.reference_link.should be_nil
      @article.reference_note.should be_nil
    end
  end
  
  context "with an article with meta data" do
    before { @article = Factory.create(:article_with_meta_data) }
    
    it "should have meta data" do
      @article.should have_meta_data
    end
    
    it "should return values for meta data fields" do
      @article.reference_link.should_not be_nil
      @article.reference_note.should_not be_nil
    end
  end
  
  context "with an article after setting meta data fields through mutators" do
    before do
      @article = Factory.create(:article)
      @article.reference_link = "http://railsgarden.com/"
      @article.reference_note = "Notes"
    end
    
    it "should have meta data" do
      @article.should have_meta_data
    end
    
    it "should return values for meta data fields" do
      @article.reference_link.should == "http://railsgarden.com/"
      @article.reference_note.should == "Notes"
    end
  end
  
end