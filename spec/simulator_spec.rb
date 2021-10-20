# frozen_string_literal: true

RSpec.describe ToyRobot::Simulator do
  subject { ToyRobot::Simulator.new }

  describe '#report' do
    it 'reports that there is no robot' do
      expect(subject.report).to eq('No robot placed')
    end

    context 'when a robot has been placed' do
      before { subject.place_robot(0, 0, 'SOUTH') }

      it 'reports the status of the robot' do
        expect(subject.report).to eq('0,0,SOUTH')
      end
    end
  end

  describe '#place_robot' do
    let(:x) { 0 }
    let(:y) { 0 }
    let(:facing) { 'NORTH' }

    before { subject.place_robot(x, y, facing) }

    it 'places the robot' do
      expect(subject.report).to eq('0,0,NORTH')
    end

    context 'with invalid co-ordinates' do
      let(:x) { 5 }

      it 'does not place the robot' do
        expect(subject.report).to eq('No robot placed')
      end
    end

    context 'with invalid facing' do
      let(:facing) { 'north' }

      it 'does not place the robot' do
        expect(subject.report).to eq('No robot placed')
      end
    end

    context 'with multiple placings' do
      before do
        placings = [[0, 0, 'NORTH'], [0, 4, 'SOUTH'], [0, 0, 'north']]
        placings.each { |placing| subject.place_robot(*placing) }
      end

      it 'finishes up in the final valid placing' do
        expect(subject.report).to eq('0,4,SOUTH')
      end
    end
  end

  describe '#drive_robot' do
    let(:command) { :left }

    it 'does nothing' do
      subject.drive_robot(command)

      expect(subject.report).to eq('No robot placed')
    end

    context 'with a placed robot' do
      before do
        subject.place_robot(1, 3, 'EAST')
        3.times { subject.drive_robot(command) }
      end

      it 'turns left three times' do
        expect(subject.report).to eq('1,3,SOUTH')
      end

      context 'with a right command' do
        let(:command) { :right }

        it 'turns right three times' do
          expect(subject.report).to eq('1,3,NORTH')
        end
      end

      context 'with a move command' do
        let(:command) { :move }

        it 'moves' do
          expect(subject.report).to eq('4,3,EAST')
        end

        context 'with a move command that will make it fall off the table' do
          it 'ignores the move command' do
            subject.drive_robot(command)

            expect(subject.report).to eq('4,3,EAST')
          end
        end
      end
    end
  end
end
