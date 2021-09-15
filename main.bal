import ballerina/io;
import ballerina/http;

type userDetails record {|
    string username;
    string lastname;
    string firstname;

|};

userDetails[] all_users = [];

service /users on new http:Listener(8080) {

    resource function get All() returns userDetails[] {

        io:println("handling GET request to /users/all");
        return all_users;
    }
    resource function post insert(@http:Payload userDetails newUser) returns json {
        io:println("handling POST request to /users/insert");
        all_users.push(newUser);
        return {done: "ok"};

    }

    resource function get one/[string username]/[string lastname] () returns json {
        io:println("handlind get one user");
        return {username: username, lastName: lastname};
        
    }
}
