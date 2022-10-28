pragma solidity 0.8.13;


import "forge-std/Test.sol";
import '../src/ThreeSigmaNFT.sol';


contract NFT is Test {
    ThreeSigmaNFT nftToken;
    address nftId;

    function setUp() public {
        nftToken = new ThreeSigmaNFT();
    }

    function testMint() public {
        nftId = msg.sender;
        nftToken.mintToken(msg.sender);
        nftToken.getToken(msg.sender);
    }

}