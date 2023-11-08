// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract Calimocho {
    uint256 public currentDocumentId;

    mapping(uint256 => string) public docIdToCid;
    mapping(string => DocumentVoting) public docCidToVoting;
    mapping(address => DocumentVoting[]) public ownerToVotings;

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
    ) public {
        DocumentVoting memory docVoting = DocumentVoting({
            documentId: currentDocumentId,
            owner: msg.sender,
            documentCid: _documentCid,
            participants: participants,
            quorum: quorum,
            expiration: expiration
        });

        docIdToCid[currentDocumentId] = _documentCid;
        docCidToVoting[_documentCid] = docVoting;

        currentDocumentId += 1;
    }

    function getOwnerDocuments(address _owner) public view returns (DocumentVoting[] memory) {
        return ownerToVotings[_owner];
    }
}
