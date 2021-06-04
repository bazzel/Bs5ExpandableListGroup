require 'rails_helper'

module Bs5
  module ExpandableList
    RSpec.describe GroupItemComponent, type: :component do
      subject { render_inline(component) }

      let(:component) { described_class.new(options) }
      let(:options) { {} }

      describe 'with items' do
        describe 'with text only' do
          subject do
            render_inline(component) { 'An item' }
          end

          it { is_expected.to have_css('div.list-group-item', text: 'An item') }
        end

        describe 'with a simple title and body' do
          subject do
            render_inline(component) do |i|
              i.title { 'An item' }
              i.body { 'Lorem ipsum dolor sit amet.' }
            end
          end

          it {
            is_expected.to have_css(
              'div.list-group-item.expandable-item .expandable-item-header .expandable-item-header-title[data-bs-toggle="collapse"][data-bs-target]', text: 'An item'
            )
          }

          it {
            is_expected.to have_css('div.list-group-item.expandable-item .expandable-item-body.collapse[id]',
                                    text: 'Lorem ipsum dolor sit amet.')
          }
        end

        describe 'with a variable header' do
          subject do
            render_inline(component) do |i|
              i.title do |t|
                t.collapsed { 'Collapsed title' }
                t.expanded { 'Expanded title' }
              end
              i.body { 'Lorem ipsum dolor sit amet.' }
            end
          end

          it {
            is_expected.to have_css(
              'div.list-group-item.expandable-item .expandable-item-header .expandable-item-header-title[data-bs-toggle="collapse"][data-bs-target] .expandable-item-header-title-collapsed', text: 'Collapsed title'
            )
          }

          it {
            is_expected.to have_css(
              'div.list-group-item.expandable-item .expandable-item-header .expandable-item-header-title[data-bs-toggle="collapse"][data-bs-target] .expandable-item-header-title-expanded', text: 'Expanded title'
            )
          }

          it {
            is_expected.to have_css('div.list-group-item.expandable-item .expandable-item-body.collapse[id]',
                                    text: 'Lorem ipsum dolor sit amet.')
          }
        end

        describe 'with actions' do
          describe 'with 1 set' do
            subject do
              render_inline(component) do |i|
                i.title { 'An item' }
                i.actions { 'Actions' }
                i.body { 'Lorem ipsum dolor sit amet.' }
              end
            end

            it {
              is_expected.to have_css(
                'div.list-group-item.expandable-item .expandable-item-header .expandable-item-header-title[data-bs-toggle="collapse"][data-bs-target]', text: 'An item'
              )
            }

            it {
              is_expected.to have_css(
                'div.list-group-item.expandable-item .expandable-item-header .expandable-item-header-actions', text: 'Actions'
              )
            }

            it {
              is_expected.to have_css('div.list-group-item.expandable-item .expandable-item-body.collapse[id]',
                                      text: 'Lorem ipsum dolor sit amet.')
            }
          end

          describe 'with 2 sets' do
            subject do
              render_inline(component) do |i|
                i.title { 'An item' }
                i.actions do |a|
                  a.collapsed { 'One action' }
                  a.expanded { 'Other action' }
                end
                i.body { 'Lorem ipsum dolor sit amet.' }
              end
            end

            it {
              is_expected.to have_css(
                'div.list-group-item.expandable-item .expandable-item-header .expandable-item-header-title[data-bs-toggle="collapse"][data-bs-target]', text: 'An item'
              )
            }

            it {
              is_expected.to have_css(
                'div.list-group-item.expandable-item .expandable-item-header .expandable-item-header-actions .expandable-item-header-actions-collapsed', text: 'One action'
              )
            }

            it {
              is_expected.to have_css(
                'div.list-group-item.expandable-item .expandable-item-header .expandable-item-header-actions .expandable-item-header-actions-expanded', text: 'Other action'
              )
            }

            it {
              is_expected.to have_css('div.list-group-item.expandable-item .expandable-item-body.collapse[id]',
                                      text: 'Lorem ipsum dolor sit amet.')
            }
          end
        end

        describe 'that behaves as a stretchable items' do
          subject do
            render_inline(component) do |i|
              i.title { 'An item' }
              i.body { 'Lorem ipsum dolor sit amet.' }
            end
          end

          let(:options) { { parent_id: 'my-id', stretchable: true } }

          it {
            is_expected.to have_css('.list-group-item[data-controller="stretchable-item"][data-stretchable-item-target="container"][data-stretchable-item-item-class="stretchable-item"][data-stretchable-item-stretched-class="stretched"]')
          }

          it {
            is_expected.to have_css('.list-group-item .expandable-item-body.collapse[data-bs-parent="#my-id"]')
          }
        end
      end
    end
  end
end
