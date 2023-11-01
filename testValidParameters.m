function tests = testValidParameters
    tests = functiontests(localfunctions);
end

function setupOnce(testCase)
    % Setting up the known parameters and the expected output
    testCase.TestData.n = 0.015;
    testCase.TestData.s0 = 0.006;
    testCase.TestData.L = 8000; 
    testCase.TestData.B = 100;
    testCase.TestData.beta = 0.6;
    
    T_initial = 0:1:120;
    testCase.TestData.Q_expected = 2000 + (6000/2)*(1 - cos(2*pi*T_initial/120));
end

function testFunction(testCase)
    Q_linear = channel_flow_simulation(testCase.TestData.n, testCase.TestData.s0, testCase.TestData.L, testCase.TestData.B, testCase.TestData.beta);
    % Verifying the boundary condition for the first spatial cell over time
    testCase.verifyEqual(Q_linear(:,1), testCase.TestData.Q_expected', 'AbsTol', 1e-10);
end
