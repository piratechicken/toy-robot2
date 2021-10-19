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

  describe '#turn_left' do
    it 'turns to the WEST' do
      subject.turn_left

      expect(subject.facing).to eq('WEST')
    end

    context 'when it is facing EAST' do
      let(:facing) { 'EAST' }

      it 'turns to the NORTH' do
        subject.turn_left

        expect(subject.facing).to eq('NORTH')
      end
    end

    context 'when it is facing SOUTH' do
      let(:facing) { 'SOUTH' }

      it 'turns to the EAST' do
        subject.turn_left

        expect(subject.facing).to eq('EAST')
      end
    end

    context 'when it is facing WEST' do
      let(:facing) { 'WEST' }

      it 'turns to the SOUTH' do
        subject.turn_left

        expect(subject.facing).to eq('SOUTH')
      end
    end
  end

  describe '#turn_right' do
    it 'turns to the EAST' do
      subject.turn_right

      expect(subject.facing).to eq('EAST')
    end

    context 'when it is facing EAST' do
      let(:facing) { 'EAST' }

      it 'turns to the SOUTH' do
        subject.turn_right

        expect(subject.facing).to eq('SOUTH')
      end
    end

    context 'when it is facing SOUTH' do
      let(:facing) { 'SOUTH' }

      it 'turns to the WEST' do
        subject.turn_right

        expect(subject.facing).to eq('WEST')
      end
    end

    context 'when it is facing WEST' do
      let(:facing) { 'WEST' }

      it 'turns to the NORTH' do
        subject.turn_right

        expect(subject.facing).to eq('NORTH')
      end
    end
  end
end
