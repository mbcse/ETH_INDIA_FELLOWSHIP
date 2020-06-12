var Web3=require('web3');

var web3=new Web3(Web3.givenProvider || "http://127.0.0.1:8545/");
var account="on43323";
web3.eth.personal.getAccounts().then((data)=>
{
   
    account=data;
    console.log("Accounts present:"+"\nAccount 1: "+account[0]+"\nAccont 2: "+account[1]+"\n");
    
}).then(()=>{

    console.log("Balance Account 1:");
    web3.eth.getBalance(account[0]).then(console.log).then(()=>{
        console.log("Balance Account 2: ");    
        web3.eth.getBalance(account[1]).then(console.log).then(()=>
        {
            
            console.log("Signing message hash: ")
            web3.eth.personal.sign("gEth is Money",account[0],"mbhat@3690").then((hash)=>
            {
                console.log(hash+"\n")
            }).then(()=>
            {

    console.log("Sending Transaction");            
    web3.eth.personal.sendTransaction({
        from: account[0],
        gasPrice: "20000000000",
        gas: "2100000",
        to: account[1],
        value: "10",
        data: ""
    }, "mbhat@3690").then(console.log);

              
            });
            
        });
    })
    
})

