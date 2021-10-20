# frozen_string_literal: true
require 'byebug'

RSpec.describe ToyRobot::Brain do
  subject { ToyRobot::Brain.new }

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

  context 'it ignores other commands prior to valid place'
  context 'report'
  context 'move'
  context 'invalid move'
  context 'turn left'
  context 'turn right'
end
