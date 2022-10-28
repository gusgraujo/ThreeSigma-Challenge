pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Challenge.sol";

contract ChallengeTest is Test {
    address challenge;

    function setUp() public {
        challenge = address(new Challenge());
    }

    function testDepositFunds() public {
        Challenge(challenge).depositFund{value: 1 ether}();
        assertEq(address(challenge).balance, 1 ether);
    }

    function testRewardFunds() public {
        
    }
}