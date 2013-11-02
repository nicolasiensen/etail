require 'spec_helper'

describe Store do
  it { should validate_presence_of :name }
  it { should validate_presence_of :token }
  it { should validate_uniqueness_of :token }
end
