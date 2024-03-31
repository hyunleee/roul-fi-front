# Roul-Fi

These days lots of liquid staking protocols are showing up. They offer reward yields for staking, but it's only 5% for staking an Ethereum in Lido. To lift up the yield amount and to become an entertainment source for usres, ‘Roul-Fi’ offers Probability Redistribution based on DeFi. Users can participate in ‘Raffles’ based on the RST tokens that receive as a reward for staking. Connected with Neon EVM, it becomes easy to send micro transaction with fast and less fee than others. By stimulating and driving interest in staking, ‘Roul-Fi’ can help grow the ecosystem and increase TVL.

## Agenda

1. [Introduce](#introduce)
2. [Installation](#installation)
3. [Usage](#usage)
4. [Contribution](#contribution)

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

## Usage

**1. Main**

<img width="1920" alt="KakaoTalk_20240331_141750022_01" src="https://github.com/hyunleee/roul-fi-front/assets/100356715/01e7e9b3-477d-4c4b-8fd7-7fcaac907461">

The first time you visit ‘Roul-Fi’, you'll see this page. There are short introduction of 'Roul-fi'. You need to connect with you own wallet (For now, Metamask only) to proceed.

**2. Stake**

![KakaoTalk_20240331_123526757_02](https://github.com/hyunleee/roul-fi-front/assets/100356715/2add41e5-86ef-49db-92bc-5e4fffefbb4e)


The staking is one of key features of ‘Roul-Fi’. You can stake your ETH from wallet as much as you want. Since ‘Roul-Fi’ has a feature of liquid staking, you will receive same amount of rsETH, which is Roul-Fi staked ETH. And as an yield, ‘Roul-Fi’ issues RST, which is ‘Roul-Fi’ utility token.

**3. Play**

<img width="1920" alt="KakaoTalk_20240331_141750022_02" src="https://github.com/hyunleee/roul-fi-front/assets/100356715/bdd97ed4-eb7f-4295-9e65-06235ea43d7a">

‘Play’, this is where 'Roul-fi' has a competitive advantage. RST token, that claimed from staking ETH, it can be used as a way to pay to participate in Raffles. You need to write total 7 numbers, between 1 and 20. Right after entering the numbers and the amount of bets you will participate, contracts will start making random numbers which is the answer of the raffle and compare with the numbers you send. As this process will be done in blockchain contracts, ‘Roul-Fi’ guarantees transparency of the raffle. If the number of ball is same as the number that from contracts, you will get xN amount of RST as many numbers you matched.

**4. Leaderboard**

<img width="1920" alt="KakaoTalk_20240331_141750022" src="https://github.com/hyunleee/roul-fi-front/assets/100356715/c5a2dc48-97b3-47d1-8d39-f2c0fce51889">


 How many games are done, how much grants that users claimed, will be displayed in Leaderboard. And your stats will also be displayed in this page. You'll be ranked based on the games you've played and the amount of money you've bet, and we plan to offer airdrops based on your ranking.



## Contribution
- [Park DoYeon](https://github.com/parkttule)
- [Lee hyunlee](https://github.com/hyunleee)
- [Lee shiohn](https://github.com/bestzion)
- [Jeong-min](mailto::lleonadee@gmail.com)

