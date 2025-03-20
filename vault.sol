// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SavingsVault {
    address payable owner;

    function setOwner() public {
        require(owner == address(0), "Owner already set");
        owner = payable(msg.sender);
    }

    function deposit() public payable {}

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        payable(msg.sender).transfer(address(this).balance);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
