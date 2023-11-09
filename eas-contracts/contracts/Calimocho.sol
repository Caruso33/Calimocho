// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract Calimocho {
    uint256 public currentDocumentId;

    mapping(uint256 => string) public docIdToCid;
    mapping(string => DocumentVoting) public docCidToVoting;
    mapping(address => DocumentVoting[]) public ownerToVotings;

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
        string memory _documentName,
        string memory _documentCid,
        address[] memory _participants,
        uint64 _expiration,
        uint256 _quorum
    ) public {
        DocumentVoting memory docVoting = DocumentVoting({
            documentId: currentDocumentId,
            documentName: _documentName,
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

    function getDocument(string memory _documentCid) public view returns (DocumentVoting memory) {
        return docCidToVoting[_documentCid];
    }

 function getAllDocuments() public view returns (DocumentVoting[] memory) {
    uint256 totalDocuments = currentDocumentId;
    DocumentVoting[] memory allDocuments = new DocumentVoting[](totalDocuments);

    for (uint256 i = 0; i < totalDocuments; i++) {
        string memory documentCid = docIdToCid[i];
        DocumentVoting memory docVoting = docCidToVoting[documentCid];
        allDocuments[i] = docVoting;
    }

    return allDocuments;
}
}