# frozen_string_literal: true

module Bs5
  module ExpandableList
    class GroupComponent < ViewComponent::Base
      renders_many :items, lambda { |options = {}|
        options.merge!(parent_id: id, stretchable: stretchable?)
        GroupItemComponent.new(**options)
      }

      attr_reader :options, :is_accordion, :is_stretchable, :tag_name

      DEFAULT_TAG_NAME = :div

      def initialize(options = {})
        @is_accordion = options.delete(:accordion)
        @is_stretchable = options.delete(:stretchable)
        @id = options.delete(:id)
        @tag_name = options.delete(:tag) || DEFAULT_TAG_NAME
        @options = options
      end

      private

      def id
        @id || (accordion? && "list-group-#{object_id}")
      end

      def component_class
        ['list-group'].tap do |arr|
          arr << @options[:class]
        end
      end

      def component_attributes
        options.merge(id: id, class: component_class)
      end

      alias accordion? is_accordion
      alias stretchable? is_stretchable
    end
  end
end
