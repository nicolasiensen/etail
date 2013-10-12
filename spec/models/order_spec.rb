require 'spec_helper'

describe Order do
  it { should validate_presence_of :subtotal }
  it { should validate_presence_of :uid }
  it { should validate_uniqueness_of :uid }

  describe "#confirmed?" do
    context "when it was confirmed" do
      before { subject.stub(:confirmed_at).and_return(Time.now) }
      its(:confirmed?) { should be_true }
    end
    
    context "when it was not confirmed" do
      its(:confirmed?) { should be_false }
    end
  end
end
