# frozen_string_literal: true

module Bs5
  class ExpandableListItemComponent < ViewComponent::Base
    DEFAULT_WRAPPER_TAG = :div
    renders_one :title, lambda {
      ExpandableListItemHeaderTitleComponent.new(target_id: target_id)
    }
    renders_one :actions, ExpandableListItemHeaderActionsComponent
    renders_one :body

    attr_reader :parent_id, :stretchable, :wrapper_html

    def initialize(options = {})
      @parent_id = options.delete(:parent_id)
      @stretchable = options.delete(:stretchable)
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
        yield
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

    def stimulus_attributes
      {
        controller: stimulus_controller,
        "#{stimulus_controller}-target": 'container',
        "#{stimulus_controller}-item-class": 'stretchable-item',
        "#{stimulus_controller}-stretched-class": 'stretched'
      }
    end

    def stimulus_controller
      'stretchable-item'
    end

    alias stretchable? stretchable
  end
end
