require 'rails_helper'

module Bs5
  RSpec.describe ExpandableListGroupComponent, type: :component do
    subject { render_inline(component) }

    let(:component) { described_class.new(options) }
    let(:options) { {} }

    describe 'the component' do
      it { is_expected.to have_css('div.list-group') }

      describe 'with a classname' do
        let(:options) { { class: 'lorem' } }

        it { is_expected.to have_css('div.list-group.lorem') }
      end

      describe 'with a custom tag' do
        let(:options) { { tag: :turbo_frame } }

        it { is_expected.to have_css('turbo-frame.list-group') }
      end

      describe 'with extra attributes' do
        let(:options) do
          {
            tag: :turbo_frame,
            id: 'tray',
            loading: :lazy,
            src: 'http://example.com'
          }
        end

        it { is_expected.to have_css('turbo-frame#tray.list-group[loading="lazy"][src="http://example.com"]') }
      end
    end

    describe 'with items' do
      describe 'that behaves as an accordion' do
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
          is_expected.to have_css('.expandable-item-body.collapse[id][data-bs-parent]',
                                  text: 'Lorem ipsum dolor sit amet.')
        }

        describe 'with an id passed' do
          let(:options) { { accordion: true, id: 'my-id' } }

          it { is_expected.to have_css('div.list-group[id="my-id"]') }

          it {
            is_expected.to have_css('.expandable-item-body.collapse[id][data-bs-parent="#my-id"]',
                                    text: 'Lorem ipsum dolor sit amet.')
          }
        end

        describe 'with a wrapper' do
          subject do
            render_inline(component) do |c|
              c.item(wrapper_html: { tag: :span, class: 'lorem' }) { 'An item' }
            end
          end

          it { is_expected.to have_css('div.list-group span.lorem div.list-group-item', text: 'An item', count: 1) }
        end
      end

      describe 'that behaves as a list of stretchable items' do
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

    describe 'with custom block (instead of items)' do
      subject do
        render_inline(component) { 'An item' }
      end

      it { is_expected.to have_css('div.list-group', text: 'An item') }
    end
  end
end
