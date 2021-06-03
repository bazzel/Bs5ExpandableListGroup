module Bs5ExpandableListGroup
  class Engine < ::Rails::Engine
    isolate_namespace Bs5ExpandableListGroup

    # We don't want the developer to add the helper so we 'automate' this:
    config.to_prepare do
      ActionController::Base.helper(ViewComponentsHelper)
    end

    config.generators do |g|
      g.test_framework :rspec
      g.assets false
      g.helper false
    end
  end
end
