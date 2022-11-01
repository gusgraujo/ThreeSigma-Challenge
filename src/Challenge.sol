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
    
    uint public timeTrackFunds; // public time track to the fund competition
    uint public timeTrackNFT; // public time track to the NFT competition
    address public winnerFunds; //public winner to the fund competition
    address public winnerNFT; //public winner to the NFT competition
    uint[] public stake; // array to stake the nft of the players
    uint stakeCounter; // number of stake
    address nftAdress; // addres of the ERC-721

    constructor (address _nftAddress){
        nftAdress = _nftAddress;
        stakeCounter = 0; // sets the stake counter to 0
    }
    //This function is responsable for receive the funds from the player, allocate the right player as the winner and set the time for receive the funds to zero.
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
    //This function is responsable for receive the Non-Fungible-token from the player and stake, also allocates the right player as the winner and set the time for receive the NFT's to zero.
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
    //This function is responsable for send the funds to the winner player.
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
    //This function is responsable for send the NFT's to the winner player.
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
