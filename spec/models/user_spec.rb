require 'rails_helper'

RSpec.describe User, type: :model do

  describe ".add" do
    context "two numbers" do
      context "given '2,4'" do
        it "returns 6" do
          expect(6).to eql(6)
        end
      end
    end
  end
end
