var Web3=require('web3');
function sleep(milliseconds) { 
    let timeStart = new Date().getTime(); 
    while (true) { 
        let elapsedTime = new Date().getTime() - timeStart; 
        if (elapsedTime > milliseconds) { 
            break; 
        } 
    } 
} 

var web3=new Web3(Web3.givenProvider || "http://127.0.0.1:8545/");

function gethash(n)
{
    web3.eth.getBlock(n)
    .then((data)=>
    {
        console.log(n+" "+data.hash+"\n");
    });
}

console.log("Hashes of Blocks\n")
for(var i=0;i<128;i++)
{
    gethash(i);
    
}



