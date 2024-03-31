# Roul-Fi

These days lots of liquid staking protocols are showing up. They offer reward yields for staking, but it's only 5% for staking an Ethereum in Lido. To lift up the yield amount and to become an entertainment source for usres, ‘Roul-Fi’ offers Probability Redistribution based on DeFi. Users can participate in ‘Raffles’ based on the RST tokens that receive as a reward for staking. Connected with Neon EVM, it becomes easy to send micro transaction with fast and less fee than others. By stimulating and driving interest in staking, ‘Roul-Fi’ can help grow the ecosystem and increase TVL.

## Agende

1. [Introduce](#introduce)
2. [Installation](#installation)
3. [Usage](#usage)
4. [Contribution](#contribution)
5. [License](#license)

## Introduce

This is 'Roul-Fi' that first introduce the concept of 'Possibility Redistribution based on DeFi'. 'Roul - Fi' suggests one of the solution to maximize the yield gets from liquid staking. 

These days lots of liquid staking protocols are showing up. They offer reward yields for staking, but it's only 5% for staking an Ethereum in Lido.

Users can claim RST token as an yield when they stake their asset. And can paritipate 'Raffles' system provided by 'Roul-Fi' by spending RST token.

By stimulating and driving interest in staking, ‘Roul-Fi’ can help grow the ecosystem and increase TVL. In this process, there could be concerns about losses because of winning raffle. But 'Roul - Fi' stimulation shows that the RST held by Roul-Fi will not decrease as users continue to participate in the game and win. This will lead to ensure reliable liquidity in ecosystem and 'Roul - Fi' can make a profit at the expense of a few users.

POC (Proof-of-Concept)
```typescript
import { ethers } from "hardhat";

function getRandomNumber(): number[] {

    let randomNumbers: number[] = [];

    for (let i = 0; i < 7; i++) {
        randomNumbers.push(Math.floor(Math.random() * 20) + 1);
    }

    return randomNumbers;
}

async function main() {
    const [owner, user] = await ethers.getSigners();
    const rouleToken = (await ethers.deployContract("RouleFiToken")).connect(owner);
    const rouleTokenAddress = await rouleToken.getAddress();

    console.log("RouleFiToken Address: ", rouleTokenAddress);

    const Roulefinance = (await ethers.deployContract("Roulefinance", [rouleTokenAddress])).connect(owner);
    const RoulefinanceAddress = await Roulefinance.getAddress();

    console.log("RouleFinance Address: ", RoulefinanceAddress);

    await rouleToken.connect(owner).initialize(RoulefinanceAddress);

    await rouleToken.connect(user).faucet();
    await Roulefinance.connect(owner).mint();

    console.log("user balance: ", await rouleToken.connect(user).balanceOf(user.address));
    console.log("TVL  balance: ", await rouleToken.connect(owner).balanceOf(RoulefinanceAddress));

    for (let i=0; i < 100; i++) {
        await Roulefinance.connect(user).buy(100, getRandomNumber());
        await Roulefinance.connect(user).claim();
        console.log(await rouleToken.connect(user).balanceOf(user.address));
    }    

    console.log("user balance: ", await rouleToken.connect(user).balanceOf(user.address));
    console.log("TVL  balance: ", await rouleToken.connect(owner).balanceOf(RoulefinanceAddress));

}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
})
```


![image](https://github.com/hyunleee/roul-fi-front/assets/100356715/b21bea1c-1e4a-4ec8-9c47-43f543279239)

Connection with Neon EVM, By writing frequent raffle information on the blockchain, 'Roul-Fi' is expect to reduce costs and improve speed. Also it is looking forward to expanding 'Roul - Fi' ecosystem beyond Ethereum and into the Solana ecosystem.

## Installation

1. Clone this repository.

```bash
$ git clone https://github.com/hyunleee/roul-fi-front.git
$ cd roule-fi-front
```

2. You start the web server.
```bash
$ sudo apt update
$ sduo apt install nginx
$ sudo systemctl start nginx
```
