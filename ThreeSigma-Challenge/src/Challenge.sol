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
    function getReward()  
     public 
     payable
     {
        require(block.timestamp > (timeTrack + 1 days));
        (bool sent, ) = msg.sender.call{value: address(this).balance}("");

    }
}
