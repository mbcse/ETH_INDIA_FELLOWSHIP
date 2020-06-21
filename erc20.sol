pragma solidity >=0.5.0 <0.6.8;

contract mberc

{

string public constant name = "MBtoken";
string public constant symbol = "MBT";
uint8 public constant decimals = 5;

 mapping(address => uint256) balances;

 mapping(address => mapping (address => uint256)) allowed;

 uint256 _totalSupply = 100000000000;

 address public owner;
 
constructor() public{
     owner=msg.sender;
     balances[owner] = _totalSupply;
 }

function totalSupply() public view returns  (uint256  theTotalSupply) {

   theTotalSupply = _totalSupply;
   return theTotalSupply;

 }

 function balanceOf(address _owner) public view  returns (uint256 balance) {

   return balances[_owner];

 }
 
 
 function approve(address _spender, uint256 _amount) public returns (bool success) {

   allowed[msg.sender][_spender] = _amount;
 emit  Approval(msg.sender, _spender, _amount);

   return true;

 }

 
 function transfer(address _to, uint256 _amount) public returns (bool success) {

 if (balances[msg.sender] >= _amount

     && _amount > 0

     && balances[_to] + _amount > balances[_to]) {

     balances[msg.sender] -= _amount;

     balances[_to] += _amount;

  emit   Transfer(msg.sender, _to, _amount);

       return true;

     } else {

       return false;

     }

  }


  function transferFrom(address _from, address _to, uint256 _amount) public returns (bool success) {

   if (balances[_from] >= _amount

     && allowed[_from][msg.sender] >= _amount

     && _amount > 0

     && balances[_to] + _amount > balances[_to]) {

   balances[_from] -= _amount;

   balances[_to] += _amount;

  emit Transfer(_from, _to, _amount);

     return true;

   } else {

     return false;

   }

 }

 

 function allowance(address _owner, address _spender) public returns (uint256 remaining) {

   return allowed[_owner][_spender];

 }



event Approval(address indexed _owner, address indexed _spender, uint256 _value);



event Transfer(address indexed _from, address indexed _to, uint256 _value);

}
