// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "./Financable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract CourseFactory is Financable, Pausable{
  /*
   * Constant variables
   */
  

  uint constant public WAGE = 100000000000000000 wei;


  /*
   * State variables
   */
  
  // Course structure
  struct Course {
    string description;
    uint createdAt;
    uint finishedAt;
    uint value;
    uint deadline;
    bool completed;
    bool killed;
  }

  // Courses
  mapping (address => Course[]) public courses;


  /* 
   * Event
   */

  // Courses updated event
  event LogCoursesUpdated ();


  /* 
   * Modifiers
   */

  // Due date should be after current block timestamp
  modifier validDeadline (uint _deadline) {
    require(_deadline > block.timestamp);
    _;
  }

  modifier validPrize (uint _value) {
    require(_value >= WAGE);
    _;
  }

  modifier validToRemove (uint _id){
    require(getCourse(_id).completed || getCourse(_id).killed);
    _;
  }


  // If a course is not completed
  modifier incomplete (uint _id) {
    require(!getCourse(_id).completed);
    _;
  }

  /* 
   * Functions
   */

  // Add course
  function _add(string memory _description, uint _deadline)
    internal validDeadline(_deadline) validPrize(msg.value) 
  {
    // Create a course instance
    Course memory course = Course({
      // Input parameters
      description: _description,
      deadline: _deadline,
      // Autofill course creation timestamp
      createdAt: block.timestamp,
      finishedAt: 100,
      // Default values
      value: msg.value,
      completed: false,
      killed: false
    });

    // Push created course to user's courses
    courses[msg.sender].push(course);

    // Log courses are updated
    emit LogCoursesUpdated();
  }

  // Set complete
  function _setComplete(uint _id)
    internal
    incomplete(_id)
  {
    require(!isExpired(_id), "due date is expired");
    Course memory course = getCourse(_id);

    course.completed = true;
    course.finishedAt = block.timestamp;
    uint valueBack = course.value - WAGE ;
    payOwn(WAGE);
    payUser(valueBack);
    replace(_id, course);
    //addPrize(msg.sender, course.value);
   
  }

  // Remove course
  function _remove(uint _id)
   internal
   validToRemove(_id)
  {
    uint userCoursesLength = courses[msg.sender].length;

    require(_id < userCoursesLength);

    courses[msg.sender][_id] = courses[msg.sender][userCoursesLength - 1];
    courses[msg.sender].pop();

    emit LogCoursesUpdated();
  }
  

  // Kill a course
  function _kill(uint _id) internal {
    Course memory course = getCourse(_id);
    require(isExpired(_id), "due date is expired");
    course.killed = true;
    payOwn(course.value);
    replace(_id, course);
  }

  // Replace course
  function replace(uint _id, Course memory _course) private {
    courses[msg.sender][_id] = _course;

    emit LogCoursesUpdated();
  }


  // Is course overdue
  function isExpired(uint _id) private view returns (bool) {
    Course memory course = getCourse(_id);
    if (course.deadline == 0) {
      return false;
    }
    return (course.deadline < block.timestamp);
  }


  // Get current user courses
  function _getCourses() internal view returns(Course[] memory) {
    return courses[msg.sender];
  }


  // Get course
  function getCourse(uint _id) private view returns(Course memory) {
    require(courses[msg.sender].length>_id);
    return courses[msg.sender][_id];
  }
  

}