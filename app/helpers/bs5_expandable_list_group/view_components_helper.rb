module Bs5ExpandableListGroup
  module ViewComponentsHelper
    def bs5_expandable_list_group(*args)
      render ::Bs5::ExpandableList::GroupComponent.new(*args) do |c|
        yield c if block_given?
      end
    end
  end
end
