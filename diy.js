var Web3=require('web3');

var web3=new Web3(Web3.givenProvider || "http://127.0.0.1:8545/");

async function run() {

	 accounts = await web3.eth.getAccounts();
	//Get list of addresses generated by Ganache (local development blockchain)
	console.log(accounts);
	const balance = await web3.eth.getBalance(accounts[0]);
	//Print Ether balance in wei of first address of `accounts` array
	console.log(balance);
  }

  run();
var cAddress="0x174ef088f013d32c2b9ea2cd8cf75ecf3bf68462";
var abi=[
	{
		"constant": false,
		"inputs": [],
		"name": "claimAmount",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [],
		"name": "deposit",
		"outputs": [],
		"payable": true,
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [],
		"name": "IamAlive",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"internalType": "address",
				"name": "_address",
				"type": "address"
			}
		],
		"name": "setRecovery",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "getBalance",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	}
]
var myContract=new web3.eth.Contract(abi,cAddress);
var weiValue = web3.utils.toWei("0.01",'ether');
myContract.methods.deposit().send({from: accounts[0]})
.on('transactionHash', function(hash){
    
})
.on('receipt', function(receipt){
    
})
.on('confirmation', function(confirmationNumber, receipt){
    
})
.on('error', console.error);