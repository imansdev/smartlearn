// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;
//pragma experimental ABIEncoderV2; // Two level dynamic arrays support

import "@openzeppelin/contracts/access/Ownable.sol";
import "./CourseFactory.sol";

contract SmartLearn is Ownable, CourseFactory{

  /// @notice Get all courses of msg sender
  /// @return Courses array
  function getCourses() public view returns (Course[] memory) {
    return _getCourses();
  }
  
  /// @notice Add a new course for msg sender
  /// @param _description Course decription
  /// @param _deadline Course due date
  function add(string memory _description, uint _deadline) public payable {
    _add(_description, _deadline);
  }


  // Set a course as completed
  function setComplete(uint _id) public {
    _setComplete(_id);
  }

  // Remove a course
  function remove(uint _id) public {
    _remove(_id);
  }

  // Add prize to a course
  // function setPrize(uint _id) public payable {
  //   _setPrize(_id);
  // }

  // Kill a course
  function kill(uint _id) public {
    _kill(_id);
  }
  

  // Pause contract deposits
  function pause() public onlyOwner() {
    _pause();
  }

  // Unpause contract deposits
  function unpause() public onlyOwner() {
    _unpause();
  }

}
