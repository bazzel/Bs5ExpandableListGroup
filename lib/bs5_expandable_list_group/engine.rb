module Bs5ExpandableListGroup
  class Engine < ::Rails::Engine
    isolate_namespace Bs5ExpandableListGroup

    config.generators do |g|
      g.test_framework :rspec
      g.assets false
      g.helper false
    end
  end
end
