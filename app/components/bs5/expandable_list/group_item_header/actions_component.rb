# frozen_string_literal: true

module Bs5
  module ExpandableList
    module GroupItemHeader
      class ActionsComponent < ViewComponent::Base
        renders_one :collapsed
        renders_one :expanded

        private

        def variable_actions?
          collapsed || expanded
        end
      end
    end
  end
end
