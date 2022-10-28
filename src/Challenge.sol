// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


interface IERC721{
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;
    function approve(address to, uint256 tokenId) external;
    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4);
}


contract Challenge {
    
    uint timeTrackFunds;
    uint timeTrackNFT;
    address winnerFunds;
    address winnerNFT;
    uint[] stake;
    uint stakeCounter;
    address nftAdress;

    constructor (address _nftAddress){
        nftAdress = _nftAddress;
        stakeCounter = 0;
    }

    function depositFund()
     public 
     payable
    {
        require(msg.value > 0,"The value deposited need to be greater than 0");
        require(block.timestamp <= (timeTrackFunds + 1 days),"The time for deposit Ether is over");
        require(winnerFunds != msg.sender);
        timeTrackFunds = block.timestamp;
        winnerFunds = msg.sender;
    }

    function depositToken(uint _tokenId)
     public
    {   
        require(block.timestamp <= (timeTrackFunds + 1 days),"The time for deposit NFT is over");
        require(winnerNFT != msg.sender,"You are already the winner");
        stake[stakeCounter] = _tokenId;
        stakeCounter++;
        winnerNFT = msg.sender;
        IERC721(nftAdress).safeTransferFrom(msg.sender, address(this), _tokenId,"");
    }

    function getRewardFund()  
     public 
     payable
     {
        uint balance = address(this).balance;
        require(msg.sender == winnerFunds);
        require(block.timestamp > (timeTrackFunds + 1 days));
        require(balance > 0 wei, "No balance available"); 
        (bool sent, ) = winnerFunds.call{value: balance}("");
    }

    function getRewardToken()
     public
    {
        require(block.timestamp > (timeTrackNFT + 1 days),"The time for deposit NFT is not over");
        require(winnerNFT == msg.sender);
        for (uint i=0; i<stake.length; i++) {
            IERC721(nftAdress).safeTransferFrom(address(this),msg.sender,stake[i],"");
            delete stake[i];
        }
    }
}
