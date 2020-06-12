var Web3=require('web3');
const { promises } = require('dns');
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




    web3.eth.getBlockNumber().then((bn)=>{
        console.log(bn);
  
        for(var i=11000;i<13000;i++)
        {
            
            web3.eth.getBlock(i).then((block)=>
            {
               
                if(block.transactions){
        
                    block.transactions.forEach((hash)=>
                    {
                        
                             web3.eth.getTransaction(hash).then((t)=>
                                {
                                    
                                        
                                console.log(t.blockNumber+" "+ t.to);

                                        
                                    
                                    
                                });

                                sleep(10)

                    });
            

                }
            }).catch((err)=>
            {
                console.log(err);
            });
  
           

}
});
  