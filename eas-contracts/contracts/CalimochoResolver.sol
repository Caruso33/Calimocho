// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import { SchemaResolver } from "./resolver/SchemaResolver.sol";

import { IEAS, Attestation } from "./IEAS.sol";
import { ICalimocho } from "./ICalimocho.sol";

/// @title CalimochoResolver
abstract contract CalimochoResolver is SchemaResolver {
    ICalimocho private immutable _Calimocho;
    // IEAS private immutable _EAS;

    constructor(IEAS eas, ICalimocho calimocho) SchemaResolver(eas) {
        _Calimocho = calimocho;
    }

    function onAttest(Attestation calldata _attestation) internal view returns (bool) {
        // bytes32 attestationData = bytes32(attestation.data);

        // uint8 votingOption =  uint8(attestationData);
        // uint64 expiration = uint64(attestationData << 8);
        // bytes memory documentCidBytes = bytes(attestationData << 9);
        // string memory documentCid = string(documentCidBytes);

        // ICalimocho.DocumentVoting memory _voting = _Calimocho.docCidToVoting(documentCid);
    
        // if (_voting.currentVotes + 1 > _voting.quorum) {
        //     return false;
        // }

        // bool found;
        // for (uint256 i = 0; i < _voting.participants.length; i++) {
        //     if (_voting.participants[i] == attestation.attester) {
        //         found = true;
        //     }
        // }
        // if (!found) {
        //     return false;
        // }

        // if (expiration != _voting.expiration) {
        //     return false;
        // }

        // if (_voting.expiration > block.timestamp) {
        //     return false;
        // }

        // _Calimocho.addVote(_voting.documentCid, votingOption);

        return true;
    }

    function onRevoke(Attestation calldata /*attestation*/, uint256 /*value*/) internal pure override returns (bool) {
        return true;
    }
}
