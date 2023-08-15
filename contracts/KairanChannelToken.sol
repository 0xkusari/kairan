// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract KairanChannelToken is ERC721Enumerable, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    struct Subscription {
        uint256 userId;
        uint256 channelId;
    }

    struct Channel {
        string feedURL;
        string imageURL;
        string title;
    }

    mapping(uint256 => Subscription) public idToSubscription;
    mapping(uint256 => Channel) public idToChannel;

    constructor() ERC721("KairanChannelToken", "KCT") {}

    function mint(uint256 userId, uint256 channelId, string memory feedURL, string memory imageURL, string memory title) public onlyOwner returns (uint256) {
        _tokenIdCounter.increment();
        uint256 newTokenId = _tokenIdCounter.current();
        _safeMint(msg.sender, newTokenId);
        idToSubscription[newTokenId] = Subscription(userId, channelId);
        idToChannel[channelId] = Channel(feedURL, imageURL, title);
        return newTokenId;
    }

    function getSubscription(uint256 tokenId) public view returns (uint256, uint256) {
        Subscription memory subscription = idToSubscription[tokenId];
        return (subscription.userId, subscription.channelId);
    }

    function getChannel(uint256 channelId) public view returns (string memory, string memory, string memory) {
        Channel memory channel = idToChannel[channelId];
        return (channel.feedURL, channel.imageURL, channel.title);
    }
}

