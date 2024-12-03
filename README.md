# 🔗 Blockchain-Based Decentralized Lottery Smart Contract
> A decentralized, blockchain-powered lottery contract on Ethereum, enabling fair player entry, random winner selection, and secure prize distribution with complete transparency.

---

## 🔥 Key Features

- 🧠 **Manager-controlled lottery**: Only the contract's manager (deployer) can pick the winner, ensuring full control and transparency.
- 🖥️ **Player entry with minimum payment**: Players can enter the lottery by paying a minimum amount of 1 ether, ensuring a fair participation cost.
- 🔐 **Prevent duplicate entries**: The contract prevents players from entering multiple times, ensuring fairness in the draw.
- 🌐 **Fair winner selection**: The contract uses a pseudo-random number generation based on blockchain data like `block.timestamp` and `block.prevrandao`, ensuring randomness and transparency.
- 💸 **Prize distribution**: The winner receives the full contract balance, ensuring they receive the complete prize without any interference.
- 🧾 **System reset after each round**: After a winner is selected, the system is reset, clearing all players and allowing a new round of participation.
- 📊 **No installation required**: Being a blockchain contract, this solution does not require any installation or agent-based setups, making it lightweight and decentralized.

---

## 📂 Key Functions

| Function | Description |
|----------|-------------|
| `enter()` | Allows players to enter the lottery by paying at least 1 ether. This function includes checks to prevent duplicate entries and ensure fair play. |
| `random()` | A private function that generates a pseudo-random number based on blockchain data (e.g., `block.prevrandao`, `block.timestamp`, and the number of players). It simulates randomness, but due to Ethereum's deterministic nature, for higher security, you can integrate Chainlink VRF (Verifiable Random Function) in production environments. |
| `pickWinner()` | Only callable by the contract manager (the deployer). This function uses the `random()` function to select a winner and transfer the entire contract balance to them. It then resets the players list to prepare for the next round. |
| `getPlayers()` | Allows anyone to view the current list of players who have entered the lottery. This is a public function and ensures transparency. |

---

## ⚙️ Requirements

To deploy and interact with the Lottery Smart Contract, the following are required:

- **Solidity Version**: ^0.8.9 (Used for the contract development)
- **Ethereum Wallet**: Required for deploying and interacting with the smart contract. Example wallets include MetaMask, WalletConnect, or any other Ethereum-compatible wallet.
- **Development Environment**: Ethereum development tools like **Hardhat** or **Truffle** for compiling, testing, and deploying the contract.

---

## ▶️ How to Deploy

Follow these steps to deploy the contract to the Ethereum blockchain:

1. **Set up your development environment**:
   - Install **Node.js** (LTS version recommended).
   - Install **Hardhat** (or use Truffle if preferred).

   ```bash
   npm init -y
   npm install --save-dev hardhat
   ```

2. **Compile the contract**:
   - If using Hardhat, use the following command to compile your Solidity contract:

   ```bash
   npx hardhat compile
   ```

3. **Deploy the contract**:
   - Create a deploy script in the `scripts` folder (e.g., `scripts/deploy.js`):

   ```javascript
   async function main() {
       const [deployer] = await ethers.getSigners();
       console.log("Deploying contracts with the account:", deployer.address);

       const Lottery = await ethers.getContractFactory("Lottery");
       const lottery = await Lottery.deploy();
       console.log("Lottery contract deployed to:", lottery.address);
   }

   main().catch((error) => {
       console.error(error);
       process.exitCode = 1;
   });
   ```

   - Deploy to a testnet (like Rinkeby):

   ```bash
   npx hardhat run scripts/deploy.js --network rinkeby
   ```

4. **Interact with the deployed contract** using **MetaMask** or other Ethereum wallets by sending transactions to the smart contract's deployed address.

---

### 🚨 **If the above steps don't work for you**, use the **Remix IDE** (Online Solidity Compiler) to deploy and test the smart contract easily.

1. Visit **[Remix IDE](https://remix.ethereum.org)**.
2. Create a new Solidity file (e.g., `Lottery.sol`) and paste the smart contract code into it.
3. **Compile the contract** by selecting the appropriate Solidity version (e.g., 0.8.9).
4. In the **Deploy & Run Transactions** tab, choose the appropriate environment (e.g., Injected Web3 for MetaMask or JavaScript VM for testing).
5. **Deploy the contract** by clicking on the "Deploy" button.
6. Once deployed, you can interact with the contract by calling the functions (e.g., `enter()`, `pickWinner()`, `getPlayers()`) directly from the Remix interface.

---

## 📦 Usage Example

### 1. **Entering the Lottery (Player)**
Players can enter the lottery by calling the `enter()` function and sending a minimum of 1 ether.

```javascript
const lotteryContract = new web3.eth.Contract(abi, contractAddress);
lotteryContract.methods.enter().send({
  from: playerAddress,
  value: web3.utils.toWei('1', 'ether'),
});
```

### 2. **Picking a Winner (Manager)**
The manager (deployer) can call `pickWinner()` to randomly select a winner and transfer the prize.

```javascript
lotteryContract.methods.pickWinner().send({ from: managerAddress });
```

### 3. **Get Players**
Anyone can check the list of players using `getPlayers()` to see who is currently entered in the lottery.

```javascript
lotteryContract.methods.getPlayers().call();
```

---

## 🧠 Contract Highlights

- ❌ **No duplicate entries**: Each address can only enter the lottery once.
- 🎯 **Manager-only winner selection**: Only the deployer (manager) can trigger the winner selection process.
- 🧾 **Fair randomness**: The contract uses blockchain data to ensure that the random number generation is not manipulated.
- 📊 **Transparent prize distribution**: All transactions, including the selection of the winner, are recorded on the blockchain, ensuring full transparency.

---

## 📁 Output Format Details

- **Transaction Logs**: Each transaction (entry, winner selection, prize distribution) is recorded and publicly visible on the Ethereum blockchain. These logs can be viewed using block explorers like [Etherscan](https://etherscan.io/).
- **Smart Contract Events**: The contract emits events like `Entry` and `WinnerSelected` for off-chain monitoring and tracking purposes.

---

## 🧩 Customize It

- 🎯 **Change the entry amount**: Modify the `require` statement in the `enter()` function to adjust the minimum entry fee.
- 🔁 **Chainlink VRF**: For more secure random number generation, integrate **Chainlink VRF** in the `random()` function.
- 🌐 **Multi-winner lottery**: Modify the contract to allow multiple winners by selecting more than one winner and distributing the prize proportionally.
- 🏆 **Lottery time-based draw**: Add a time limit for entering the lottery, and allow the contract to automatically pick a winner after the time is up.

---

## 🔐 Security Considerations

- **Reentrancy attacks**: The contract is written with caution to avoid reentrancy attacks, particularly with the prize transfer to the winner.
- **Gas limitations**: Keep in mind that transactions involving a large number of players may incur higher gas costs. Consider limiting the number of players or using batch processing for large lotteries.

---

📜 License

Open-source | MIT License  
This contract is intended for educational and experimental purposes only. Do not use on the Ethereum mainnet without extensive testing.

---
Contribution 0
Contribution 1
Contribution 2
Contribution 3
Contribution 4
Contribution 5
Contribution 6
Contribution 7
