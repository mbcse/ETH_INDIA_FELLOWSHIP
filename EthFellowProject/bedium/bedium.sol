pragma solidity >=0.5.0 <0.6.8;


interface daiErc20 {
   function approve(address, uint256) external returns (bool);
  // function transfer(address, uint256) external returns (bool);
   function transferFrom(address src, address dst, uint wad) external returns (bool);
   function balanceOf(address) external view  returns (uint256 balance);
}


interface CompoundErc20 {
    function mint(uint256) external returns (uint256);

   // function exchangeRateCurrent() external returns (uint256);

   // function supplyRatePerBlock() external returns (uint256);

   // function redeem(uint) external returns (uint);

  //  function redeemUnderlying(uint) external returns (uint);
}



contract bedium{
    
    daiErc20 dai=daiErc20(0x4F96Fe3b7A6Cf9725f59d353F723c1bDb64CA6Aa);
    CompoundErc20 compound=CompoundErc20(0xF0d0EB522cfa50B716B3b1604C4F0fA6f04376AD);
    
    uint totalPost;
    address owner;
    uint myCTokens;
    
    mapping(uint=>address) postAuthor;
    mapping(uint=>string) postHash;
    mapping(uint=>string) imageHash;
    mapping(uint=>string) postTitle;
   
    
    uint[] posts;
    mapping(address=>uint[]) postsList;
    mapping(address=>uint) totalUserPosts;
    mapping(address=>uint) subscriptionPeriod;
    
    constructor() public{
       owner=msg.sender; 
    }
    
    // function updatePost(uint id, string memory hash) public returns(bool){
    //     if(totalPost>=id && postAuthor[id]==msg.sender){
    //          postHash[id]=hash;
    //          return(true);
    //     }
    //     return false;
    // }
    
    // function UpdateAuthor(uint id,string memory name) public returns(bool){
    //     if(bytes(postHash[id]).length!=0 && postAuthor[id]==msg.sender){
    //     authorName[id]=name;
    //     return(true);
    //     }
    //     return false;
    // }
    
    
    function setNewPost(string memory _fileHash, string memory _imageHash, string memory _title ) public returns(uint){
        postAuthor[++totalPost]=msg.sender;
        postHash[totalPost]=_fileHash;
        imageHash[totalPost]=_imageHash;
        postTitle[totalPost]=_title;
        postsList[msg.sender].push(totalPost);
        totalUserPosts[msg.sender]+=1;
        return totalPost;
    }
    
    function getPost(uint _id) public view returns(uint, address, string memory,string memory ,string memory){
        return (_id, postAuthor[_id], postHash[_id], imageHash[_id], postTitle[_id]);
    }
    
    function getTotalPost() public view returns(uint){
        return totalPost;
    }
    
    function getUserTotalPosts() public view returns(uint){
        return totalUserPosts[msg.sender];
    }
     
    function getUserPostsArray() public view returns(uint[] memory){
        return postsList[msg.sender];
    }
    
    
    
    function checkSubscribed() public view returns(bool){
        if(block.timestamp>subscriptionPeriod[msg.sender]){
            return false;
        }
      return true;
    }
    
    
    function transferDai(uint _amount) public returns(bool){
        dai.transferFrom(msg.sender,address(this),_amount);
        subscriptionPeriod[msg.sender]=block.timestamp+30 days;
        return true;
    }
    
    function transferToCompound(uint _amount) public returns(bool){
     dai.approve(address(compound), _amount);
      uint mintResult = compound.mint(_amount);
      myCTokens+=mintResult;
      return true;
    }
    
    function Balance() public view returns(uint){
         require(msg.sender==owner);
         return dai.balanceOf(address(this));
    }
    
    
    function MyCTokensBalance() public view returns(uint){
        require(msg.sender==owner);
        return myCTokens;
    }
    
    function getSubscriptionPeriod() public view returns(uint){
        return subscriptionPeriod[msg.sender];
    }
    
    
    
}