# frozen_string_literal: true

RSpec.describe ToyRobot::Robot do
  subject { ToyRobot::Robot.new(x, y, facing) }

  let(:x) { 0 }
  let(:y) { 0 }
  let(:facing) { 'NORTH' }

  describe '#move' do
    it 'moves four spaces up' do
      4.times { subject.move }

      expect(subject.position).to eq('0,4')
    end

    context 'when facing SOUTH' do
      let(:y) { 4 }
      let(:facing) { 'SOUTH' }

      it 'moves three spaces down' do
        3.times { subject.move }

        expect(subject.position).to eq('0,1')
      end
    end

    context 'when facing EAST' do
      let(:facing) { 'EAST' }

      it 'moves two spaces right' do
        2.times { subject.move }

        expect(subject.position).to eq('2,0')
      end
    end

    context 'when facing WEST' do
      let(:x) { 3 }
      let(:facing) { 'WEST' }

      it 'moves one space left' do
        subject.move

        expect(subject.position).to eq('2,0')
      end
    end
  end
end
