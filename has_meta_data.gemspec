# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{has_meta_data}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ben Hughes"]
  s.date = %q{2009-01-16}
  s.description = %q{Create one model backed by a primary table and a supplementary 'meta' table.}
  s.email = %q{ben@railsgarden.com}
  s.extra_rdoc_files = ["CHANGELOG", "lib/has_meta_data.rb", "README.rdoc", "tasks/has_meta_data_tasks.rake"]
  s.files = ["CHANGELOG", "has_meta_data_plugin.sqlite3", "init.rb", "install.rb", "lib/has_meta_data.rb", "Manifest", "MIT-LICENSE", "Rakefile", "README.rdoc", "tasks/has_meta_data_tasks.rake", "test/config/database.yml", "test/has_meta_data_test.rb", "test/models/article.rb", "test/schema.rb", "test/test_helper.rb", "uninstall.rb", "has_meta_data.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/railsgarden/has_meta_data}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Has_meta_data", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{has_meta_data}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Create one model backed by a primary table and a supplementary 'meta' table.}
  s.test_files = ["test/has_meta_data_test.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
