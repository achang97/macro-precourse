//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "ONLY_OWNER");
        _;
    }

    receive() payable external {
        // Do nothing
    }

    function changeTokens() public {
        tokens[0] = "VET";
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function transferAll(address payable destination) public onlyOwner {
        destination.transfer(address(this).balance);
    }

    function start() public {
        players.push(msg.sender);
    }

    function concatenate(string memory a, string memory b) public pure returns (string memory) {
        return string(abi.encodePacked(a, b));
    }
}
