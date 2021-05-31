require_relative 'lib/bs5_expandable_list_group/version'

Gem::Specification.new do |spec|
  spec.name        = 'bs5_expandable_list_group'
  spec.version     = Bs5ExpandableListGroup::VERSION
  spec.authors     = ['Patrick Baselier']
  spec.email       = ['patrick.baselier@gmail.com']
  spec.homepage    = 'https://github.com/bazzel/Bs5ExpandableListGroup'
  spec.summary     = 'Summary of Bs5ExpandableListGroup.'
  spec.description = 'Description of Bs5ExpandableListGroup.'
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata['allowed_push_host'] = "Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  # spec.metadata['source_code_uri'] = "Put your gem's public repo URL here."
  # spec.metadata['changelog_uri'] = "Put your gem's CHANGELOG.md URL here."

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '~> 6.1.3', '>= 6.1.3.2'
  spec.add_dependency 'view_component', '~> 2.32'
end
