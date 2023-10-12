// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Example {
    address owner;

    struct Counter {
        uint256 number;
        string description;
    }

    Counter counter;

    modifier onlyOwner() {
        require(msg.sender == owner, "only owner can mutate count number");
        _;
    }

    constructor(uint256 initial_value, string memory description) {
        owner = msg.sender;
        counter = Counter(initial_value, description);
    }

    function increment_number() external onlyOwner {
        counter.number += 1;
    }

    function decrement_number() external onlyOwner {
        counter.number -= 1;
    }

    function retrieve_number() external view returns (uint256) {
        return counter.number;
    }

    function retrieve_description() external view returns (string memory) {
        return counter.description;
    }
}
