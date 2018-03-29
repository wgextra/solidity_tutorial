pragma solidity ^0.4.19;

contract constrainedToken {
  address[] internal whitelist;
  address internal _owner;

  function addToWhiteList(address _addr) public{
    if(msg.sender == _owner){
      whitelist.push(_addr);
    }
  }

  /*Extremely inefficient and keeps indices for deleted values....*/
  function removeFromWhiteList(address _addr) public{
    if(msg.sender == _owner){
      for(uint i=0;i<whitelist.length;i++){
        if(_addr == whitelist[i]){
          delete whitelist[i];
        }
      }
    }
  }
  function constrainedToken() public {
    _owner = msg.sender;
  }

  function getWhitelist() public returns (address[]){
      return whitelist;
  }
}
