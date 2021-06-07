# frozen_string_literal: true

module Bs5
  module ExpandableList
    class GroupItemComponent < ViewComponent::Base
      DEFAULT_WRAPPER_TAG = :div
      DEFAULT_TAG_NAME = :div
      renders_one :title, lambda {
        GroupItemHeader::TitleComponent.new(target_id: target_id, expanded: expanded?)
      }
      renders_one :actions, GroupItemHeader::ActionsComponent
      renders_one :body

      attr_reader :parent_id, :is_stretchable, :is_expanded, :tag_name, :wrapper_html, :options

      def initialize(options = {})
        @parent_id = options.delete(:parent_id)
        @is_stretchable = options.delete(:stretchable)
        @is_expanded = options.delete(:expanded)
        @tag_name = options.delete(:tag) || DEFAULT_TAG_NAME
        @wrapper_html = options.delete(:wrapper_html)
        @options = options
      end

      private

      def wrapper_html?
        @wrapper_html.present?
      end

      def wrapper_tag
        @wrapper_html.delete(:tag) || DEFAULT_WRAPPER_TAG
      end

      def wrapper(&block)
        if wrapper_html?
          tag.send(wrapper_tag, **wrapper_html, &block)
        else
          capture { block.call }
        end
      end

      def simple_content?
        title.blank? && body.blank? && actions.blank?
      end

      def target_id
        "expandable-list-item-#{object_id}"
      end

      def body_data_options
        {}.tap do |h|
          h['bs-parent'] = "##{parent_id}" if parent_id
        end
      end

      def component_data_options
        {}.tap do |h|
          h.merge!(stimulus_attributes) if stretchable?
        end
      end

      def component_class
        ['list-group-item'].tap do |arr|
          arr << 'expandable-item' unless simple_content?
          arr << 'stretchable-item'
          arr << 'stretched' if !simple_content? && expanded?
        end
      end

      def body_class
        %w[expandable-item-body collapse].tap do |arr|
          arr << 'show' if expanded?
        end
      end

      def component_attributes
        options.tap do |h|
          h[:class] = component_class
          h[:data] =  component_data_options unless simple_content?
        end
      end

      def stimulus_attributes
        {
          controller: stimulus_controller,
          "#{stimulus_controller}-target": 'container',
          "#{stimulus_controller}-stretched-class": 'stretched'
        }
      end

      def stimulus_controller
        'stretchable-item'
      end

      alias stretchable? is_stretchable
      alias expanded? is_expanded
    end
  end
end
