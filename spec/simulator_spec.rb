# frozen_string_literal: true

RSpec.describe ToyRobot::Simulator do
  subject { ToyRobot::Simulator.new }

  describe '#report' do
    it 'reports that there is no robot' do
      expect { subject.report }.to output("No robot placed\n").to_stdout
    end

    context 'when a robot has been placed' do
      before { subject.place(0, 0, 'SOUTH') }

      it 'reports the status of the robot' do
        expect { subject.report }.to output("0,0,SOUTH\n").to_stdout
      end
    end
  end

  describe '#place' do
    let(:x) { 0 }
    let(:y) { 0 }
    let(:facing) { 'NORTH' }

    before { subject.place(x, y, facing) }

    it 'places the robot' do
      expect { subject.report }.to output("0,0,NORTH\n").to_stdout
    end

    context 'with invalid co-ordinates' do
      let(:x) { 5 }

      it 'does not place the robot' do
        expect { subject.report }.to output("No robot placed\n").to_stdout
      end
    end

    context 'with invalid facing' do
      let(:facing) { 'north' }

      it 'does not place the robot' do
        expect { subject.report }.to output("No robot placed\n").to_stdout
      end
    end

    context 'with multiple placings' do
      before do
        placings = [[0, 0, 'NORTH'], [0, 4, 'SOUTH'], [0, 0, 'north']]
        placings.each { |placing| subject.place(*placing) }
      end

      it 'finishes up in the final valid placing' do
        expect { subject.report }.to output("0,4,SOUTH\n").to_stdout
      end
    end
  end

  describe '#left' do
    it 'does nothing' do
      subject.left

      expect { subject.report }.to output("No robot placed\n").to_stdout
    end

    context 'with a placed robot' do
      before do
        subject.place(1, 3, 'EAST')
        3.times { subject.left }
      end

      it 'turns left three times' do
        expect { subject.report }.to output("1,3,SOUTH\n").to_stdout
      end
    end
  end

  describe '#right' do
    before do
      subject.place(1, 3, 'EAST')
      3.times { subject.right }
    end

    it 'turns right three times' do
      expect { subject.report }.to output("1,3,NORTH\n").to_stdout
    end
  end

  describe '#move' do
    before do
      subject.place(1, 3, 'EAST')
      3.times { subject.move }
    end

    it 'moves' do
      expect { subject.report }.to output("4,3,EAST\n").to_stdout
    end

    context 'with a move command that will make it fall off the table' do
      it 'ignores the move command' do
        subject.move

        expect { subject.report }.to output("4,3,EAST\n").to_stdout
      end
    end
  end
end
