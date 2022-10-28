pragma solidity 0.8.13;


import "forge-std/Test.sol";
import '../src/ThreeSigmaChallenge.sol';


contract NFT is Test {
    ThreeSigmaChallengeToken nftToken;
    address nftId;

    function setUp() public {
        nftToken = new ThreeSigmaChallengeToken();
    }

    function testMint() public {
        nftId = msg.sender;
        nftToken.mintToken(msg.sender);
        nftToken.getToken(msg.sender);
    }

}