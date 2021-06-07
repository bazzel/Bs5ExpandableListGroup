# frozen_string_literal: true

module Bs5
  module ExpandableList
    module GroupItemHeader
      class TitleComponent < ViewComponent::Base
        renders_one :collapsed
        renders_one :expanded

        attr_reader :target_id, :is_expanded

        def initialize(target_id:, expanded: false)
          @target_id = target_id
          @is_expanded = expanded
        end

        private

        def variable_title?
          collapsed || expanded
        end

        alias expanded? is_expanded
      end
    end
  end
end
