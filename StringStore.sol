pragma solidity ^0.4.6;

contract StringStore {

    string saySomething;

    function StringStore() {
        saySomething = "How do you do!";
    }

    function speak() constant returns(string itSays) {
        return saySomething;
    }

    function saySomethingElse(string newSaying) returns(bool success) {
        saySomething = newSaying;
        return true;
    }

}