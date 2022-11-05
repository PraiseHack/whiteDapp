//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract Whitelist {
    uint8 public maxWhitelistedAddresses;

    mapping(address => bool) public whitelistedAddresses;

    uint8 public numAddresesWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "sender has already been whitelisted");
        require(numAddresesWhitelisted < maxWhitelistedAddresses, "more addreses can't be added, limit reached");

        whitelistedAddresses[msg.sender] = true;

        numAddresesWhitelisted += 1;
    }
}