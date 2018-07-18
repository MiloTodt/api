# frozen_string_literal: true

require 'spec_helper'

describe Circle do
  before { @circle = FactoryBot.build(:circle) }

  subject { @circle }
  it { should be_valid }
end
