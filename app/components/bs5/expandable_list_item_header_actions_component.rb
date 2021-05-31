# frozen_string_literal: true

module Bs5
  class ExpandableListItemHeaderActionsComponent < ViewComponent::Base
    renders_one :collapsed
    renders_one :expanded

    private

    def variable_actions?
      collapsed || expanded
    end
  end
end
