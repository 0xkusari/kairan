// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {KairanChannelToken} from "../src/KairanChannelToken.sol";
import "openzeppelin-contracts/contracts/token/ERC721/IERC721Receiver.sol";

contract KairaChannelTokenTest is IERC721Receiver, Test {
    KairanChannelToken public token;

    function setUp() public {
        token = new KairanChannelToken();
    }

    function test_Mint() public {
        uint256 tokenId = token.mint(1, 3, "https://example.com/feed", "https://example.com/images/1.jpg", "example.com world");
        console2.log("tokenId: %d", tokenId);
        assertEq(tokenId, 1);
    }

    // これを実装しないと ERC721: transfer to non ERC721Receiver implementer というエラーが出る
    function onERC721Received(
        address,
        address,
        uint256,
        bytes memory
    ) public virtual override returns (bytes4) {
        return this.onERC721Received.selector;
    }
}
