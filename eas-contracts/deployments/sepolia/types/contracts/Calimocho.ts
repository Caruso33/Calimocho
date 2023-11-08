/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */
import type {
  BaseContract,
  BigNumberish,
  BytesLike,
  FunctionFragment,
  Result,
  Interface,
  AddressLike,
  ContractRunner,
  ContractMethod,
  Listener,
} from "ethers";
import type {
  TypedContractEvent,
  TypedDeferredTopicFilter,
  TypedEventLog,
  TypedListener,
  TypedContractMethod,
} from "../common";

export declare namespace Calimocho {
  export type DocumentVotingStruct = {
    documentId: BigNumberish;
    owner: AddressLike;
    documentCid: string;
    participants: AddressLike[];
    quorum: BigNumberish;
    expiration: string;
  };

  export type DocumentVotingStructOutput = [
    documentId: bigint,
    owner: string,
    documentCid: string,
    participants: string[],
    quorum: bigint,
    expiration: string
  ] & {
    documentId: bigint;
    owner: string;
    documentCid: string;
    participants: string[];
    quorum: bigint;
    expiration: string;
  };
}

export interface CalimochoInterface extends Interface {
  getFunction(
    nameOrSignature:
      | "currentDocumentId"
      | "docCidToVoting"
      | "docIdToCid"
      | "getOwnerDocuments"
      | "ownerToVotings"
      | "registerDocument"
  ): FunctionFragment;

  encodeFunctionData(
    functionFragment: "currentDocumentId",
    values?: undefined
  ): string;
  encodeFunctionData(
    functionFragment: "docCidToVoting",
    values: [string]
  ): string;
  encodeFunctionData(
    functionFragment: "docIdToCid",
    values: [BigNumberish]
  ): string;
  encodeFunctionData(
    functionFragment: "getOwnerDocuments",
    values: [AddressLike]
  ): string;
  encodeFunctionData(
    functionFragment: "ownerToVotings",
    values: [AddressLike, BigNumberish]
  ): string;
  encodeFunctionData(
    functionFragment: "registerDocument",
    values: [string, AddressLike[], BigNumberish, string]
  ): string;

  decodeFunctionResult(
    functionFragment: "currentDocumentId",
    data: BytesLike
  ): Result;
  decodeFunctionResult(
    functionFragment: "docCidToVoting",
    data: BytesLike
  ): Result;
  decodeFunctionResult(functionFragment: "docIdToCid", data: BytesLike): Result;
  decodeFunctionResult(
    functionFragment: "getOwnerDocuments",
    data: BytesLike
  ): Result;
  decodeFunctionResult(
    functionFragment: "ownerToVotings",
    data: BytesLike
  ): Result;
  decodeFunctionResult(
    functionFragment: "registerDocument",
    data: BytesLike
  ): Result;
}

export interface Calimocho extends BaseContract {
  connect(runner?: ContractRunner | null): Calimocho;
  waitForDeployment(): Promise<this>;

  interface: CalimochoInterface;

  queryFilter<TCEvent extends TypedContractEvent>(
    event: TCEvent,
    fromBlockOrBlockhash?: string | number | undefined,
    toBlock?: string | number | undefined
  ): Promise<Array<TypedEventLog<TCEvent>>>;
  queryFilter<TCEvent extends TypedContractEvent>(
    filter: TypedDeferredTopicFilter<TCEvent>,
    fromBlockOrBlockhash?: string | number | undefined,
    toBlock?: string | number | undefined
  ): Promise<Array<TypedEventLog<TCEvent>>>;

  on<TCEvent extends TypedContractEvent>(
    event: TCEvent,
    listener: TypedListener<TCEvent>
  ): Promise<this>;
  on<TCEvent extends TypedContractEvent>(
    filter: TypedDeferredTopicFilter<TCEvent>,
    listener: TypedListener<TCEvent>
  ): Promise<this>;

  once<TCEvent extends TypedContractEvent>(
    event: TCEvent,
    listener: TypedListener<TCEvent>
  ): Promise<this>;
  once<TCEvent extends TypedContractEvent>(
    filter: TypedDeferredTopicFilter<TCEvent>,
    listener: TypedListener<TCEvent>
  ): Promise<this>;

  listeners<TCEvent extends TypedContractEvent>(
    event: TCEvent
  ): Promise<Array<TypedListener<TCEvent>>>;
  listeners(eventName?: string): Promise<Array<Listener>>;
  removeAllListeners<TCEvent extends TypedContractEvent>(
    event?: TCEvent
  ): Promise<this>;

  currentDocumentId: TypedContractMethod<[], [bigint], "view">;

  docCidToVoting: TypedContractMethod<
    [arg0: string],
    [
      [bigint, string, string, bigint, string] & {
        documentId: bigint;
        owner: string;
        documentCid: string;
        quorum: bigint;
        expiration: string;
      }
    ],
    "view"
  >;

  docIdToCid: TypedContractMethod<[arg0: BigNumberish], [string], "view">;

  getOwnerDocuments: TypedContractMethod<
    [_owner: AddressLike],
    [Calimocho.DocumentVotingStructOutput[]],
    "view"
  >;

  ownerToVotings: TypedContractMethod<
    [arg0: AddressLike, arg1: BigNumberish],
    [
      [bigint, string, string, bigint, string] & {
        documentId: bigint;
        owner: string;
        documentCid: string;
        quorum: bigint;
        expiration: string;
      }
    ],
    "view"
  >;

  registerDocument: TypedContractMethod<
    [
      _documentCid: string,
      participants: AddressLike[],
      quorum: BigNumberish,
      expiration: string
    ],
    [void],
    "nonpayable"
  >;

  getFunction<T extends ContractMethod = ContractMethod>(
    key: string | FunctionFragment
  ): T;

  getFunction(
    nameOrSignature: "currentDocumentId"
  ): TypedContractMethod<[], [bigint], "view">;
  getFunction(
    nameOrSignature: "docCidToVoting"
  ): TypedContractMethod<
    [arg0: string],
    [
      [bigint, string, string, bigint, string] & {
        documentId: bigint;
        owner: string;
        documentCid: string;
        quorum: bigint;
        expiration: string;
      }
    ],
    "view"
  >;
  getFunction(
    nameOrSignature: "docIdToCid"
  ): TypedContractMethod<[arg0: BigNumberish], [string], "view">;
  getFunction(
    nameOrSignature: "getOwnerDocuments"
  ): TypedContractMethod<
    [_owner: AddressLike],
    [Calimocho.DocumentVotingStructOutput[]],
    "view"
  >;
  getFunction(
    nameOrSignature: "ownerToVotings"
  ): TypedContractMethod<
    [arg0: AddressLike, arg1: BigNumberish],
    [
      [bigint, string, string, bigint, string] & {
        documentId: bigint;
        owner: string;
        documentCid: string;
        quorum: bigint;
        expiration: string;
      }
    ],
    "view"
  >;
  getFunction(
    nameOrSignature: "registerDocument"
  ): TypedContractMethod<
    [
      _documentCid: string,
      participants: AddressLike[],
      quorum: BigNumberish,
      expiration: string
    ],
    [void],
    "nonpayable"
  >;

  filters: {};
}