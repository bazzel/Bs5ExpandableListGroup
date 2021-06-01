require 'rails_helper'

RSpec.describe Bs5::ExpandableListGroupComponent, type: :component do
  it 'renders a component' do
    render_inline(described_class.new)

    expect(rendered_component).to have_css('div.list-group')
  end

  it 'renders a component with classname' do
    render_inline(described_class.new(class: 'lorem'))

    expect(rendered_component).to have_css('div.list-group.lorem')
  end
end
