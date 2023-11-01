# HomeworkCAS598-Testing

There are four MATLAB files in this repository. The "channel_flow_simulation.m" code is the function we are testing and comes from the codes that I have been using previously to show hydraulic routing models in hydrology. 
To test, we use the built-in testing library in MATLAB and two unit test codes, one that passes and the other that fails are stored in "testValidParameters.m" and "testInvalidParameters.m", respectively. The invalid parameteters test case changes the beta value to 0.8 which is not possible, and thus fails.
To run the tests, two commands are stored in a code called channel_flow_simulation_test.m.
