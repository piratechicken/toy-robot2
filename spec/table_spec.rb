# frozen_string_literal: true

RSpec.describe ToyRobot::Table do
  subject { ToyRobot::Table.new }

  describe '#valid_position?' do
    let(:x) { 0 }
    let(:y) { 0 }

    it 'is true' do
      expect(subject.valid_position?(x, y)).to be true
    end

    context 'with an invalid x value' do
      let(:x) { -1 }

      it 'is false' do
        expect(subject.valid_position?(x, y)).to be false
      end
    end

    context 'with an invalid y value' do
      let(:y) { 5 }

      it 'is false' do
        expect(subject.valid_position?(x, y)).to be false
      end
    end
  end
end
