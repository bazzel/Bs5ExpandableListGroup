# frozen_string_literal: true

require 'rails_helper'

module Bs5ExpandableListGroup
  RSpec.describe ViewComponentsHelper, type: :helper do
    describe '#bs5_expandable_list_group' do
      subject { helper.bs5_expandable_list_group }

      it { is_expected.to have_css('div.list-group') }
    end
  end
end
