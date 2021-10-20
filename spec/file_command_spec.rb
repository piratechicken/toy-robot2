# frozen_string_literal: true

RSpec.describe ToyRobot::FileCommand do
  subject { described_class.new(file_path) }

  let(:file_path) { "#{File.dirname(__FILE__)}/fixtures/commands.txt" }

  it 'drives and reports the robot' do
    expect { subject.run }.to output("0,3,WEST\n").to_stdout
  end
end
