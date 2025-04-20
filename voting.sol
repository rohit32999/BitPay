// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Voting {
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    mapping(uint => Candidate) public candidates;
    uint public candidatesCount;

    constructor() {
        // optional: add initial candidates here
    }

    function addCandidate(string memory _name) public {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote(uint _id) public {
        require(_id > 0 && _id <= candidatesCount, "Invalid candidate");
        candidates[_id].voteCount++;
    }

    function getCandidate(uint _id) public view returns (Candidate memory) {
        require(_id > 0 && _id <= candidatesCount, "Invalid candidate ID");
        return candidates[_id];
    }
}
