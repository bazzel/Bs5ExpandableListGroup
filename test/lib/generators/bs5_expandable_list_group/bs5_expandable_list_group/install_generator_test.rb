require "test_helper"
require "generators/bs5_expandable_list_group/install/install_generator"

module Bs5ExpandableListGroup
  class Bs5ExpandableListGroup::InstallGeneratorTest < Rails::Generators::TestCase
    tests Bs5ExpandableListGroup::InstallGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    # test "generator runs without errors" do
    #   assert_nothing_raised do
    #     run_generator ["arguments"]
    #   end
    # end
  end
end
