// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

/// @title Accounting and banking helper functions
contract Financable is ReentrancyGuard {

 
    address constant acc = 0x53FC3e38a5D9E28324901F75af617dC149FDFE5f;

    function payUser(uint amount) nonReentrant internal {
        payable(msg.sender).transfer(amount);
    }

    function payOwn (uint amounts) nonReentrant internal {
        payable(acc).transfer(amounts);
        // if (transfer){
        //     total=total+amounts;
        // }
    }

    // Fallback funciton
    // No direct payment allowed
    fallback() external payable {
        revert();
    }
    receive() external payable {
        revert();
    }
    
}