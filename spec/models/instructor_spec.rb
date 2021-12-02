require 'rails_helper'

RSpec.describe Instructor do
  it { should belong_to :dojo }
end
