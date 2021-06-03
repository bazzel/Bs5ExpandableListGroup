require_relative 'lib/bs5_expandable_list_group/version'

Gem::Specification.new do |spec|
  spec.name        = 'bs5_expandable_list_group'
  spec.version     = Bs5ExpandableListGroup::VERSION
  spec.authors     = ['Patrick Baselier']
  spec.email       = ['patrick.baselier@gmail.com']
  spec.homepage    = 'https://github.com/bazzel/Bs5ExpandableListGroup'
  spec.summary     = 'Rails engine for creating expandable and stretchable list groups with Bootstrap 5'
  spec.description = 'Bootstrap 5 expandable list group is a Ruby on Rails engine and gives you a simple API for creating expandable and stretchable list groups. A bit like Bootstrap 5\'s Accordion, Collapse and List group components combined.'
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata['allowed_push_host'] = "Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '~> 6.1.3', '>= 6.1.3.2'
  spec.add_dependency 'view_component', '~> 2.32'

  spec.add_development_dependency 'capybara', '~> 3.35.3'
  spec.add_development_dependency 'rspec-rails', '~> 5.0.1'
  spec.add_development_dependency 'sqlite3'
end
