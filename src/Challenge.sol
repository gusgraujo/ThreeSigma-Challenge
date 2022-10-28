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

}

contract Challenge {
    
    uint timeTrackFund;
    uint timeTrackNFT;
    address winner;
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
        require(block.timestamp <= (timeTrackFund + 1 days),"The time for deposit Ether is over");
        timeTrackFund = block.timestamp;
        winner = msg.sender;
    }

    function depositToken(uint _tokenId)
     public
    {   
        require(block.timestamp <= (timeTrackFund + 1 days),"The time for deposit NFT is over");
        stake[stakeCounter] = _tokenId;
        stakeCounter++;
        IERC721(nftAdress).safeTransferFrom(msg.sender, address(this), _tokenId,"");
    }

    function getRewardFund()  
     public 
     payable
     {
        uint balance = address(this).balance;
        require(msg.sender == winner);
        require(block.timestamp > (timeTrackFund + 1 days));
        require(balance > 0 wei, "No balance available"); 
        (bool sent, ) = winner.call{value: balance}("");
    }

    function getRewardToken()
     public
    {


    }
}
