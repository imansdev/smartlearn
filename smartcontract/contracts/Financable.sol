// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

/// @title Accounting and banking helper functions
contract Financable is ReentrancyGuard {
    address constant acc = 0x2bd173456f258e278f1B31418C738f205358fA76;

    function payAnother(address anotherAddress, uint256 amountt)
        internal
        nonReentrant
    {
        payable(anotherAddress).transfer(amountt);
    }

    function payUser(uint256 amount) internal nonReentrant {
        payable(msg.sender).transfer(amount);
    }

    function payOwn(uint256 amounts) internal nonReentrant {
        payable(acc).transfer(amounts);
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
