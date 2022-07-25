// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./CourseFactory.sol";

contract SmartLearn is Ownable, CourseFactory {
    /// @notice Get all courses of msg sender
    function donate() public payable {
        _donate();
    }

    /// @return Courses array
    function getCourses() public view returns (Course[] memory) {
        return _getCourses();
    }

    /// @notice Add a new course for msg sender
    /// @param _description Course decription
    /// @param _deadline Course due date
    function add(
        string memory _description,
        uint256 _deadline,
        address _anotherWallet,
        bool _dontPunishMe,
        bool _toAnother
    ) public payable {
        _add(
            _description,
            _deadline,
            _anotherWallet,
            _dontPunishMe,
            _toAnother
        );
    }

    // Set a course as completed
    function setComplete(uint256 _id) public {
        _setComplete(_id);
    }

    // Remove a course
    function remove(uint256 _id) public {
        _remove(_id);
    }

    // Kill a course
    function kill(uint256 _id) public {
        _kill(_id);
    }

    // Pause contract deposits
    function pause() public onlyOwner {
        _pause();
    }

    // Unpause contract deposits
    function unpause() public onlyOwner {
        _unpause();
    }
}
