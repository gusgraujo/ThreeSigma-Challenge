pragma solidity ^0.8.13;

import "../src/Challenge.sol";
import "forge-std/Test.sol";

contract ChallengeTest is Test {
    Challenge challenge;
    address nftToken;

    function setUp() public {
        challenge = new Challenge(nftToken);
    }

    function testDepositFunds() public {
        challenge.depositFund{value: 1 ether}();
        assertEq(address(challenge).balance, 1 ether);
    }

    function testRewardFunds() public {
        
    }
}