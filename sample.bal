import ballerina/http;
import ballerina/log;

type Greeting record {
    string 'from;
    string to;
    string message;
    string ccc;
};
configurable string configTestString = ?;

service / on new http:Listener(8090) {
    resource function get .(string name) returns Greeting {
        log:printInfo("config: " + configTestString);
        Greeting greetingMessage = {"from" : "Choreo", "to" : name, "message" : "Welcome to Choreo!", "ccc":configTestString};
        return greetingMessage;
    }
}
