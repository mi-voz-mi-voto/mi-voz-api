require 'rails_helper'

RSpec.describe User do
    describe 'validations' do
        it { should validate_presence_of(:first_name) }
        it { should validate_presence_of(:last_name) }
        it { should validate_presence_of(:state_name) }
        it { should validate_presence_of(:email) }
        it { should validate_uniqueness_of(:email) }
        it { should validate_presence_of(:language) }
    end
end
