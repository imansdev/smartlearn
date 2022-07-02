// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";


contract Coursable is ReentrancyGuard {

    mapping (address => uint) public total;

    function addToTotal(address _address, uint _amount) nonReentrant internal {
        uint balance = total[_address];
        balance += _amount;
        total[_address] = balance;
    }

    function getTotal() public view returns (uint) {
        return total[msg.sender];
    }
}