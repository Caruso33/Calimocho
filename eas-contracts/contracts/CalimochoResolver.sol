// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import "hardhat/console.sol";

import { SchemaResolver } from "./resolver/SchemaResolver.sol";

import { IEAS, Attestation } from "./IEAS.sol";
import { ICalimocho } from "./ICalimocho.sol";

/// @title CalimochoResolver
contract CalimochoResolver is SchemaResolver {
    ICalimocho private immutable _Calimocho;
    // IEAS private immutable _EAS;

    constructor(IEAS eas, ICalimocho calimocho) SchemaResolver(eas) {
        _Calimocho = calimocho;
    }

    function bytes32ToUint8(bytes32 b) public pure returns (uint8) {
        uint8 number;
        for(uint i=0;i<b.length;i++){
            number = number + uint8(b[i]);
        }
        return number;
    }

    function bytes32ToUint64(bytes32 b) public pure returns (uint64) {
        uint64 number;
        for(uint i=0;i<b.length;i++){
            number = number + uint64(uint8(b[i]));
        }
        return number;
    }

    function toBytes(bytes32 _data) public pure returns (bytes memory) {
        return abi.encodePacked(_data);
    }

    // function onAttest(Attestation calldata _attestation) internal override returns (bool) {
    function onAttest(Attestation calldata attestation, uint256 value) internal virtual override returns (bool) {
        bytes32 attestationData = bytes32(attestation.data);

        uint8 votingOption =  this.bytes32ToUint8(attestationData);
        console.log("votingOption");
        console.log(votingOption);
        uint64 expiration = this.bytes32ToUint64(attestationData << 8);
        console.log("expiration");
        console.log(expiration);
        bytes memory documentCidBytes = this.toBytes(attestationData << 9);
        string memory documentCid = string(documentCidBytes);
        console.log("documentCid");
        console.log(documentCid);

        ICalimocho.DocumentVoting memory _voting = _Calimocho.getDocument(documentCid);

        if (_voting.currentVotes.length + 1 > _voting.quorum) {
            return false;
        }

        bool found;
        for (uint256 i = 0; i < _voting.participants.length; i++) {
            if (_voting.participants[i] == attestation.attester) {
                found = true;
            }
        }
        if (!found) {
            return false;
        }

        if (expiration != _voting.expiration) {
            return false;
        }

        if (_voting.expiration > block.timestamp) {
            return false;
        }

        _Calimocho.addVote(_voting.documentCid, votingOption);

        return true;
    }

    function onRevoke(Attestation calldata /*attestation*/, uint256 /*value*/) internal pure override returns (bool) {
        return true;
    }
}
