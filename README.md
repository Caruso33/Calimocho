# Calimocha

## Schema

votingOptions -> uint8
expiration -> uint64
documentCid -> string

owner -> address
attester -> address

## Resolver

verifyAttestation - tests fields from above with the signature if are valid

the participant is part of the group of the cid
expiration is not yet reached
quorum is not yet reached

## Calimocho Contract

DocumentRegistry - registerDocument creates new DocumentVoting instance

mapping(documentId => documentCid)
mapping(documentCid => DocumentVoting)

struct DocumentVoting
documentId -> uint
documentCid -> string
participants -> address[]
quorum -> uint
expiration -> string
