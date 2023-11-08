// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

interface ICalimocho {
    struct DocumentVoting {
        uint documentId;
        address owner;
        string documentCid;
        address[] participants;
        uint quorum;
        string expiration;
    }

    function registerDocument(
        string memory _documentCid,
        address[] memory participants,
        uint256 quorum,
        string memory expiration
    ) external;

    function getOwnerDocuments(address _owner) external view returns (DocumentVoting[] memory);
}