// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Voting {
    mapping(address => bool) public hasVoted;
    mapping(string => uint256) public voteCount;

    event VoteCast(address indexed voter, string candidate);

    function vote(string memory _candidate) public {
        require(!hasVoted[msg.sender]);
        voteCount[_candidate] += 1;
        hasVoted[msg.sender] = true;
        emit VoteCast(msg.sender, _candidate);
    }
}
