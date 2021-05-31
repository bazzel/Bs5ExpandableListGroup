# frozen_string_literal: true

module Bs5
  class ExpandableListGroupComponent < ViewComponent::Base
    renders_many :items, lambda {
      ExpandableListItemComponent.new(parent_id: accordion? && id, stretchable: stretchable?)
    }

    attr_reader :accordion, :stretchable

    def initialize(options = {})
      @accordion = options.delete(:accordion)
      @stretchable = options.delete(:stretchable)
      @id = options[:id]
      @options = options
    end

    private

    def id
      @id || "list-group-#{object_id}"
    end

    def component_class
      class_names = ['list-group']
      class_names << @options[:class]
      class_names
    end

    alias accordion? accordion
    alias stretchable? stretchable
  end
end
