// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "hardhat/console.sol";

contract GoerliVault {

    mapping (address => uint) public accounts;

    modifier hasFunds(uint _amount) {
        require(_amount <= accounts[msg.sender], "Insufficient funds");
        _;
    }

    // Deposit funds
    function deposit() public payable {
        accounts[msg.sender] += msg.value;
    }

    // View all funds inside the vault
    function viewVault() public view returns(uint) {
        return address(this).balance;
    }

    // Withdraw any funds from the vault
    function withdraw(uint _amount) public hasFunds(_amount) {
        payable(msg.sender).transfer(_amount);
    }

    // Transfer funds to another account
    function transferFunds(address _receiver, uint _amount) public {
        payable(msg.sender).transfer(_amount); // transfer funds to another account
    }
}