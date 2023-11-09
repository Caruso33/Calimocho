// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

interface ICalimocho {
    struct DocumentVoting {
        uint documentId;
        string documentName;
        address owner;
        string documentCid;
        address[] participants;
        uint64 expiration;
        uint quorum;
        uint8[] currentVotes;
    }

    function registerDocument(
        string memory _documentCid,
        address[] memory participants,
        uint256 quorum,
        string memory expiration
    ) external;

    function addVote(string memory _documentCid, uint8 _vote) external;

    function getOwnerDocuments(address _owner) external view returns (DocumentVoting[] memory);

    function getDocument(string memory _documentCid) external view returns (DocumentVoting memory);
}