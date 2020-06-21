pragma solidity >=0.5.0 <0.6.0;

contract DIY{


mapping(address=>address) recovToPrimary;
mapping(address=>address) primToRecovery;
mapping(address=>uint) balance;
mapping (address=>uint) alive;

     function getBalanceOfContract() public view returns (uint256) {
        return address(this).balance;
    }
    
    function myBalance() public view returns(uint256){
        return balance[msg.sender];
    }
    
    function deposit() payable public{
       balance[msg.sender]+=msg.value;
    }
    
    function setRecovery(address _address) public{
        primToRecovery[msg.sender]=_address;
        recovToPrimary[_address]=msg.sender;
        alive[msg.sender]=block.number;
    }
    
     function claimTransfer(address payable _address,uint _amount) internal {
        _address.transfer(_amount);
    }
    
    function claimAmount() public {
        require((block.number-alive[recovToPrimary[msg.sender]])>10);
        claimTransfer(msg.sender,balance[recovToPrimary[msg.sender]]);
        balance[recovToPrimary[msg.sender]]=0;
        
    }
    
    function still_alive() public{
        alive[msg.sender]=block.number;
    }
    
    function aliveStatus() public view returns(uint){
        return alive[msg.sender];
    }
    
    
 

}
