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
        uint64 expiration;
        uint quorum;
        uint8[] currentVotes;
    }

    function registerDocument(
        string memory _documentCid,
        address[] memory _participants,
        uint64 _expiration,
        uint256 _quorum
    ) public {
        DocumentVoting memory docVoting = DocumentVoting({
            documentId: currentDocumentId,
            owner: msg.sender,
            documentCid: _documentCid,
            participants: _participants,
            expiration: _expiration,
            quorum: _quorum,
            currentVotes: new uint8[](0)
        });

        docIdToCid[currentDocumentId] = _documentCid;
        docCidToVoting[_documentCid] = docVoting;

        currentDocumentId += 1;
    }

    function addVote(string memory _documentCid, uint8 _vote) public {
        DocumentVoting storage docVoting = docCidToVoting[_documentCid];
        docVoting.currentVotes.push(_vote);        
    }

    function getOwnerDocuments(address _owner) public view returns (DocumentVoting[] memory) {
        return ownerToVotings[_owner];
    }
}
