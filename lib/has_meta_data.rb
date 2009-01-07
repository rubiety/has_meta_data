module Rubiety
  module HasMetaData
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      def has_meta_data(options = {}, &block)
        return if self.included_modules.include?(HasMetaData::InstanceMethods)
        include HasMetaData::InstanceMethods
        
        cattr_accessor :meta_data_class_name, :meta_data_foreign_key, :meta_data_table_name, :meta_data_columns
        
        self.meta_data_class_name = options[:class_name]  || 'Meta'
        self.meta_data_foreign_key = options[:foreign_key] || self.to_s.foreign_key
        self.meta_data_table_name = options[:table_name]  || "#{table_name_prefix}#{self.name.demodulize.underscore}_meta#{table_name_suffix}"
        
        
        # Create Relationship to Meta Data
        class_eval do
          has_one :meta, 
            :class_name => "#{self.to_s}::#{meta_data_class_name}",
            :foreign_key => meta_data_foreign_key,
            :dependent => :destroy
          
          named_scope :with_meta, :include => [:meta], :conditions => "#{meta_data_table_name}.id IS NOT NULL"
          named_scope :without_meta, :include => [:meta], :conditions => "#{meta_data_table_name}.id IS NULL"
        end
        
        # Dynamically Create Model::Meta Class
        const_set(meta_data_class_name, Class.new(ActiveRecord::Base))
        
        meta_data_class.cattr_accessor :original_class
        meta_data_class.original_class = self
        meta_data_class.set_table_name(meta_data_table_name)
        
        # Draft Parent Association
        meta_data_class.belongs_to self.to_s.demodulize.underscore.to_sym, :class_name => "::#{self.to_s}", :foreign_key => meta_data_foreign_key
        
        # Block extension
        meta_data_class.class_eval(&block) if block_given?
        
        # Finally setup attribute delegation to the meta fields
        self.meta_data_columns = meta_data_class.content_columns.map(&:name)
        
        meta_data_columns.each do |field|
          define_method(field.to_sym) do
            meta.send(field.to_sym) if has_meta_data?
          end
          
          define_method("#{field}=".to_sym) do |value|
            self.build_meta unless has_meta_data?
            meta.send("#{field}=".to_sym, value)
          end
        end
      end
      
      def meta_data_class
        const_get(meta_data_class_name)
      end
    end
    
    module InstanceMethods
      def has_meta_data?
        !self.meta.nil?
      end
    end
  end
end