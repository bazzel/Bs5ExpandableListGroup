require 'rails_helper'

RSpec.describe Bs5::ExpandableListGroupComponent, type: :component do
  subject { render_inline(component) }

  let(:options) { {} }
  let(:component) { described_class.new(options) }

  describe 'simple call' do
    it { is_expected.to have_css('div.list-group') }
  end

  describe 'with a classname' do
    let(:options) { { class: 'lorem' } }

    it { is_expected.to have_css('div.list-group.lorem') }
  end

  describe 'with a simple item' do
    subject do
      render_inline(component) do |c|
        c.item do |i|
          i.title { 'An item' }
          i.body { 'Lorem ipsum dolor sit amet.' }
        end
      end
    end

    it {
      is_expected.to have_css(
        'div.list-group div.list-group-item.expandable-item .expandable-item-header .expandable-item-header-title[data-bs-toggle="collapse"][data-bs-target]', text: 'An item'
      )
    }

    it {
      is_expected.to have_css('div.list-group div.list-group-item.expandable-item .expandable-item-body.collapse[id]',
                              text: 'Lorem ipsum dolor sit amet.')
    }
  end

  describe 'with an item with a variable header' do
    subject do
      render_inline(component) do |c|
        c.item do |i|
          i.title do |t|
            t.collapsed { 'Collapsed title' }
            t.expanded { 'Expanded title' }
          end
          i.body { 'Lorem ipsum dolor sit amet.' }
        end
      end
    end

    it {
      is_expected.to have_css(
        'div.list-group div.list-group-item.expandable-item .expandable-item-header .expandable-item-header-title[data-bs-toggle="collapse"][data-bs-target] .expandable-item-header-title-collaped', text: 'Collapsed title'
      )
    }

    it {
      is_expected.to have_css(
        'div.list-group div.list-group-item.expandable-item .expandable-item-header .expandable-item-header-title[data-bs-toggle="collapse"][data-bs-target] .expandable-item-header-title-expanded', text: 'Expanded title'
      )
    }

    it {
      is_expected.to have_css('div.list-group div.list-group-item.expandable-item .expandable-item-body.collapse[id]',
                              text: 'Lorem ipsum dolor sit amet.')
    }
  end

  describe 'with an item with 1 set of actions' do
    subject do
      render_inline(component) do |c|
        c.item do |i|
          i.title { 'An item' }
          i.actions { 'Actions' }
          i.body { 'Lorem ipsum dolor sit amet.' }
        end
      end
    end

    it {
      is_expected.to have_css(
        'div.list-group div.list-group-item.expandable-item .expandable-item-header .expandable-item-header-title[data-bs-toggle="collapse"][data-bs-target]', text: 'An item'
      )
    }

    it {
      is_expected.to have_css(
        'div.list-group div.list-group-item.expandable-item .expandable-item-header .expandable-item-header-actions', text: 'Actions'
      )
    }

    it {
      is_expected.to have_css('div.list-group div.list-group-item.expandable-item .expandable-item-body.collapse[id]',
                              text: 'Lorem ipsum dolor sit amet.')
    }
  end

  describe 'with an item with 1 set of actions' do
    subject do
      render_inline(component) do |c|
        c.item do |i|
          i.title { 'An item' }
          i.actions do |a|
            a.collapsed { 'One action' }
            a.expanded { 'Other action' }
          end
          i.body { 'Lorem ipsum dolor sit amet.' }
        end
      end
    end

    it {
      is_expected.to have_css(
        'div.list-group div.list-group-item.expandable-item .expandable-item-header .expandable-item-header-title[data-bs-toggle="collapse"][data-bs-target]', text: 'An item'
      )
    }

    it {
      is_expected.to have_css(
        'div.list-group div.list-group-item.expandable-item .expandable-item-header .expandable-item-header-actions .expandable-item-header-actions-collaped', text: 'One action'
      )
    }

    it {
      is_expected.to have_css(
        'div.list-group div.list-group-item.expandable-item .expandable-item-header .expandable-item-header-actions .expandable-item-header-actions-expanded', text: 'Other action'
      )
    }

    it {
      is_expected.to have_css('div.list-group div.list-group-item.expandable-item .expandable-item-body.collapse[id]',
                              text: 'Lorem ipsum dolor sit amet.')
    }
  end

  describe 'behave as an accordion' do
    subject do
      render_inline(component) do |c|
        c.item do |i|
          i.title { 'An item' }
          i.body { 'Lorem ipsum dolor sit amet.' }
        end
      end
    end

    let(:options) { { accordion: true } }

    it {
      is_expected.to have_css('.expandable-item-body.collapse[id][data-bs-parent]', text: 'Lorem ipsum dolor sit amet.')
    }

    describe 'with an id passed' do
      let(:options) { { accordion: true, id: 'my-id' } }

      it { is_expected.to have_css('div.list-group[id="my-id"]') }

      it {
        is_expected.to have_css('.expandable-item-body.collapse[id][data-bs-parent="#my-id"]',
                                text: 'Lorem ipsum dolor sit amet.')
      }
    end
  end

  describe 'behave as a list of stretchable items' do
    subject do
      render_inline(component) do |c|
        c.item do |i|
          i.title { 'An item' }
          i.body { 'Lorem ipsum dolor sit amet.' }
        end
      end
    end

    let(:options) { { stretchable: true } }

    it {
      is_expected.to have_css('div.list-group .list-group-item[data-controller="stretchable-item"][data-stretchable-item-target="container"][data-stretchable-item-item-class="stretchable-item"][data-stretchable-item-stretched-class="stretched"]')
    }
  end
end
