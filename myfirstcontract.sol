pragma solidity ^0.4.20;

interface Regulator{

    function checkValue(uint amount) returns (bool);
    function loan() returns (bool);
}


contract Bank is Regulator{
    uint private value;
    address private owner;

    modifier ownerFunc{
        require(owner==msg.sender);
        _;
    }


    function Bank(uint amount){
        value = amount;
        owner = msg.sender;
    }

    function deposit(uint amount) ownerFunc{
        value += amount;
    }

    function withdraw(uint amount) ownerFunc{
        if (checkValue(amount)){
            value -= amount;
        }
    }

    function balance() returns (uint){
        return value;
    }

    function checkValue(uint amount) returns (bool){
        return value >= amount;
    }

    function loan() returns (bool){
        if (value > 0){
            return true;
        }
    }
}

contract MyFirstContract is Bank(10){
    string private name;
    uint private age;
    
    function setName (string newName) {
        name = newName;
    }

    function getName() returns (string) {
        return name;
    }

    function setAge (uint newAge) {
        age = newAge;
    }

    function getAge() returns (uint) {
        return age;
    }
}

contract TestThrows {
    function testAssert(){
        assert(1==2);
    }
    function testRequire(){
        require(false);
    }
    function testRevert(){
        revert();
    }
    function testThrow(){
        throw;
    }
}
