require 'rails_helper'

RSpec.describe ThrowDice, type: :model do

  describe '#call' do

    context "with a single dice with 6 sides" do

      before(:all) do
        @dice = "#{rand(1..20)}"
      end

      subject(:throw_dice) do
        described_class.new(@dice)
      end

      it "receives a dice" do
        result = throw_dice.call
        expect(result.total).to be <= @dice.to_i 
      end

      it "receives a dice range" do
        result = throw_dice.call
        expect(result.total).to be_between(1, @dice.to_i)
      end

    end

    context "with the same sides" do
      subject(:throw_dice) do
        described_class.new("8,8")
      end

      it "receives 2 dices" do
        result = throw_dice.call
        expect(result.total).to be <= 16
      end
    end

    context "with the different sides" do
      subject(:throw_dice) do
        result = described_class.new("6,20")
      end

      it "receives 2 dices" do
        result = throw_dice.call
        expect(result.total).to be <= 26
      end
    end 

    context "with invalid input" do
      subject(:throw_dice) do
        result = described_class.new("6,xx")
      end

      it "receives 2 dices" do
        result = throw_dice.call
        expect(result.total).to be 0
      end
    end 

  end

end