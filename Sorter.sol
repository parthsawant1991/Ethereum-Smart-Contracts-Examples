pragma solidity ^0.4.11;

contract Sorter {

    string saySomething;
    uint8 magicNumber = 22;
    uint[] numbersList;

    function Sorter() {
        saySomething = "How do you do!";
    }

    function speak() constant returns(string itSays) {
        return saySomething;
    }
    
    function guess(uint8 guessNo) constant returns(bool Match) {
        if(guessNo == magicNumber){return true;}
        else{return false;}
    }

    function saySomethingElse(string newSaying) returns(bool success) {
        saySomething = newSaying;
        return true;
    }
    
    
    function enterNumbers(uint8[] listOfNumbers) constant returns(uint8[] sortedList) {
        
        uint8 temp = 0;
        
        bool sorting = true;
        
        while(sorting){
            
        sorting = false;
            
            for(uint j = 0;j<9;j++) {
                
                if(listOfNumbers[j]>listOfNumbers[j+1]){
                    sorting = true;
                    temp = listOfNumbers[j];
                    listOfNumbers[j] = listOfNumbers[j+1];
                    listOfNumbers[j+1] = temp;
                }
                
            }
            
        }
        

        return listOfNumbers;
    }
    
    

}
