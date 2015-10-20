require 'spec_helper'

describe port(81) do
  it { should be_listening }
end

describe port(82) do
  it { should be_listening }
end
