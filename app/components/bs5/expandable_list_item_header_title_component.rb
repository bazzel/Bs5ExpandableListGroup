# frozen_string_literal: true

module Bs5
  class ExpandableListItemHeaderTitleComponent < ViewComponent::Base
    renders_one :collapsed
    renders_one :expanded

    attr_reader :target_id

    def initialize(target_id:)
      @target_id = target_id
    end

    private

    def variable_title?
      collapsed || expanded
    end
  end
end
