require 'spec_helper'

describe Store do
  it { should validate_presence_of :name }
  it { should validate_presence_of :uid }
  it { should validate_uniqueness_of :uid }
end
