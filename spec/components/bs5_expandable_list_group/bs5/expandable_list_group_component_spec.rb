require 'rails_helper'

RSpec.describe Bs5::ExpandableListGroupComponent, type: :component do
  subject do
    render_inline(described_class.new(options))
  end

  describe 'simple call' do
    let(:options) { {} }

    it { is_expected.to have_css('div.list-group') }
  end

  describe 'with a classname' do
    let(:options) { { class: 'lorem' } }

    it { is_expected.to have_css('div.list-group.lorem') }
  end
end
