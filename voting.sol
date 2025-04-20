// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Voting {
    struct Candidate {
        uint voteCount;
        uint id;
        string name;
    }

    mapping(uint => Candidate) public candidates;
    uint public candidatesCount;

    event CandidateAdded(uint indexed id, string name);
    event Voted(uint indexed id);

    // Add a new candidate
    function addCandidate(string calldata _name) external {
        uint id = ++candidatesCount;
        candidates[id] = Candidate(0, id, _name);
        emit CandidateAdded(id, _name);
    }

    // Cast a vote for a candidate by ID
    function vote(uint _id) external {
        require(_id > 0 && _id <= candidatesCount, "Invalid candidate ID");
        unchecked {
            candidates[_id].voteCount++;
        }
        emit Voted(_id);
    }

    // Get candidate details by ID
    function getCandidate(uint _id) external view returns (Candidate memory) {
        require(_id > 0 && _id <= candidatesCount, "Invalid candidate ID");
        return candidates[_id];
    }
}
