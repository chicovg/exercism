import ballerina/http;

# Add the necessary attributes to this record to accept two operands and an operator.
#
# + operand1 - Is a float used as the first operand in an equation
# + operand2 - Is a float used as the second operand in an equation
# + operator - Is a string that represents the operator
public type Calculation record {|
    float operand1;
    float operand2;
    string operator;
|};

# Add the necessary attributes to this record to include the result value and the expression.
#
# + result - The result of the operation
# + expression - The evaluated expression that used to calculate the result
public type Response record {|
    string expression;
    float result;
|};

service / on new http:Listener(9090) {

    // Add HTTP resource function to accept a POST request on path '/calc'
    // The function should accept the above Calculation record as the payload and return a generic json object
    resource function post calc(@http:Payload Calculation calculation) returns Response {
        float a = calculation.operand1;
        float b = calculation.operand2;
        string op = calculation.operator;

        match op {
            "/" => {
                return {expression: string `${a}/${b}`, result: a / b};    
            }
            "*" => {
                return {expression: string `${a}*${b}`, result: a * b};    
            }
            "-" => {
                return {expression: string `${a}-${b}`, result: a - b};    
            }
            "+" => {
               return {expression: string `${a}+${b}`, result: a + b}; 
            } 
            _ => {
                return {expression: string `${a}${op}${b}`, result: 0.0};
            }
        }
    }
}
