# frozen_string_literal: true
require 'byebug'

RSpec.describe ToyRobot::Brain do
  subject { ToyRobot::Brain.new }

  describe '#place_robot' do
    let(:x) { 0 }
    let(:y) { 0 }
    let(:facing) { 'NORTH' }

    it 'places the robot' do
      subject.place_robot(x, y, facing)

      expect(subject.report).to eq('0,0,NORTH')
    end

    context 'with invalid co-ordinates' do
      let(:x) { 5 }

      it 'does not place the robot' do
        subject.place_robot(x, y, facing)

        expect(subject.report).to eq('No robot placed')
      end
    end

    context 'with invalid facing' do
      let(:facing) { 'north' }

      it 'does not place the robot' do
        subject.place_robot(x, y, facing)

        expect(subject.report).to eq('No robot placed')
      end
    end
  end

  context 'it can be placed several times'
  context 'it ignores other commands prior to valid place'
  context 'report'
  context 'move'
  context 'invalid move'
  context 'turn left'
  context 'turn right'
end
