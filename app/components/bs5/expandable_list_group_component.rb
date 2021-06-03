# frozen_string_literal: true

module Bs5
  class ExpandableListGroupComponent < ViewComponent::Base
    renders_many :items, lambda { |options = {}|
      options.merge!(parent_id: id, stretchable: stretchable?)
      ExpandableListItemComponent.new(**options)
    }

    attr_reader :options, :accordion, :stretchable, :tag_name

    DEFAULT_TAG_NAME = :div

    def initialize(options = {})
      @accordion = options.delete(:accordion)
      @stretchable = options.delete(:stretchable)
      @id = options.delete(:id)
      @tag_name = options.delete(:tag) || DEFAULT_TAG_NAME
      @options = options
    end

    private

    def id
      @id || (accordion? && "list-group-#{object_id}")
    end

    def component_class
      class_names = ['list-group']
      class_names << @options[:class]
      class_names
    end

    def component_attributes
      options.merge(id: id, class: component_class)
    end

    alias accordion? accordion
    alias stretchable? stretchable
  end
end
