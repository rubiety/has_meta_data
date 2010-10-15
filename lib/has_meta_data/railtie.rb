module HasMetaData
  if defined?(Rails::Railtie)
    require "rails"
    
    class Railtie < Rails::Railtie
      initializer "has_draft.extend_active_record" do
        ActiveSupport.on_load(:active_record) do
          HasMetaData::Railtie.insert
        end
      end
    end
  end
  
  class Railtie
    def self.insert
      ActiveRecord::Base.send(:include, HasMetaData)
    end
  end
end
