// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Challenge {
    uint timeTrack;
    address winner;

    function sendFund()
     public 
     payable
    {
        require(msg.value > 0);
        require(block.timestamp <= (timeTrack + 1 days));
        timeTrack = block.timestamp;
        winner = msg.sender;
    }
    
    function getRewardEther()  
     public 
     payable
     {
        uint balance = address(this).balance;
        require(block.timestamp > (timeTrack + 1 days));
        require(balance > 0 wei, "No balance available"); 
        (bool sent, ) = winner.call{value: balance}("");
    }
}