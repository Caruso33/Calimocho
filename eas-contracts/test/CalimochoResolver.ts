import Contracts from '../components/Contracts';
import { Calimocho, CalimochoResolver, SchemaRegistry, TestEAS } from '../typechain-types';
import { createWallet } from './helpers/Wallet';
import { SignatureType, expectAttestation, registerSchema } from './helpers/EAS';
import { Signer } from 'ethers';
import { EIP712Utils } from './helpers/EIP712Utils';
import { ZERO_ADDRESS } from '../utils/Constants';

describe('CalimochoResolver', () => {
  let sender: Signer;

  let registry: SchemaRegistry;
  let eas: TestEAS;

  let calimocho: Calimocho;
  let calimochoResolver: CalimochoResolver;

  let eip712Utils: EIP712Utils;

  const schema = 'uint8 votingOption,uint64 expirationTime,string documentCid';
  let schemaId: string;
  // eslint-disable-next-line max-len
  const data = '0x000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000654cf6470000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000002e516d6477476d656577655a79613632704373474a726d71737478746b7754713472774648454a394c51456a6d3450000000000000000000000000000000000000';

  beforeEach(async () => {
    sender = await createWallet();

    registry = await Contracts.SchemaRegistry.deploy();
    eas = await Contracts.TestEAS.deploy(await registry.getAddress());

    // await eas.setTime(await latest());

    calimocho = await Contracts.Calimocho.deploy();
    calimochoResolver = await Contracts.CalimochoResolver.deploy(
      await eas.getAddress(),
      await calimocho.getAddress()
    );

    schemaId = await registerSchema(schema, registry, calimochoResolver, true);

    eip712Utils = await EIP712Utils.fromVerifier(eas);
  });

  it('attest', async () => {
    await expectAttestation(
      { eas, eip712Utils },
      schemaId,
      { recipient: ZERO_ADDRESS, expirationTime: 0n, data },
      { signatureType: SignatureType.Direct, from: sender }
    );
  });
});