function tests = testInvalidParameters
    tests = functiontests(localfunctions);
end

function setupOnce(testCase)
    % Setting up the known parameters 
    testCase.TestData.n = 0.015;
    testCase.TestData.s0 = 0.006;
    testCase.TestData.L = 8000; 
    testCase.TestData.B = 100;
    testCase.TestData.beta = 0.8; % Changing beta to make the test case fail
end

function testFunction(testCase)
    Q_linear = channel_flow_simulation(testCase.TestData.n, testCase.TestData.s0, testCase.TestData.L, testCase.TestData.B, testCase.TestData.beta);
    % Asserting a condition which we expect to be false for this test case
    % Using the sum as condition
    Q_sum = sum(Q_linear(:,1));
    testCase.verifyGreaterThan(Q_sum, 1e6); 
end
