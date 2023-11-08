# Calimocha

## Schema

documentCid -> string ?
votingOptions -> uint8
expirationDate -> ?

owner -> address
attester -> address

## Resolver

verifyAttestation - tests fields from above with the signature if are valid

the participant is part of the group of the cid
expirationDate is not yet reached

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
