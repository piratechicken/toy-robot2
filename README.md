# toy-robot2
The toy robot - three years later

## Set up
This project was written in Ruby 3.0.1 but it should work in any recent ruby version.

To run specs:
- `bundle install` to install rspec
- `bundle exec rspec`

To run a toy robot simulation, call the `run_robot` file with the relative path to your commands file. An example file has been included.
- `./run_robot ./commands_example.txt`

## Project build
The `Robot` class was created first. It does three things: moves forward, turns left, turns right. It is 'aware' of the direction it is facing and its x, y co-ordinates. It will follow instructions no matter what. This is demonstrated in the spec where it can move to negative co-ordinates (which would cause it to fall off the table in the simulation).

The `Table` represents the sqaure grid. Being a square it is very sparse and its main role is to decide when a projected move will be off the table. Note: I do allow it to be initialized with a different size, even though this flexibility is not in the instructions. I felt it doesn't add any further complexity and makes it easier to expand on in future, so I left it as is.

The `Simulator` class receives the instructions and decides if they are valid or not.

Finally, the `FileCommand` class reads the text file and sends the instructions to the simulator.

## Three years ago
I did a version of the toy robot three years ago as an exercise when I first graduated Coder Academy. You can check out the similarities and differences on [Github](https://github.com/piratechicken/toy-robot-ruby).
