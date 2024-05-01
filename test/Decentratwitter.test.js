const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Decentratwitter", function () {
    let decentratwitter
    let deployer, user1, user2, users
    let URI = "SampleURI"
    let postHash = "SampleHash"
    beforeEach(async () => {
      // Get signers from development accounts 
      [deployer, user1, user2, ...users] = await ethers.getSigners();
      // We get the contract factory to deploy the contract
      const DecentratwitterFactory = await ethers.getContractFactory("Decentratwitter");
      // Deploy contract
      decentratwitter = await DecentratwitterFactory.deploy();
      // user1 mints an nfts 
      await decentratwitter.connect(user1).mint(URI)
    })
    describe('Deployment', async () => {
      it("Should track name and symbol", async function () {
        const nftName = "Decentratwitter"
        const nftSymbol = "DAPP"
        expect(await decentratwitter.name()).to.equal(nftName);
        expect(await decentratwitter.symbol()).to.equal(nftSymbol);
      });
    })