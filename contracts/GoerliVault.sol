// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "hardhat/console.sol";

contract GoerliVault {

    mapping (address => uint) public accounts;

    modifier hasFunds(uint _amount) {
        require(_amount <= accounts[msg.sender], "Insufficient funds or you are not the owner of the Vault");
        _;
    }

    // Deposit funds
    function deposit() public payable {
        accounts[msg.sender] += msg.value;
    }

    // View all funds inside the vault
    function vaultBalance() public view returns(uint) {
        return address(this).balance;
    }

    // Withdraw any funds from the vault
    function withdraw(uint _amount) public hasFunds(_amount) {
        payable(msg.sender).transfer(_amount);
    }
}