import FungibleToken from 0x05
import FlowToken from 0x05
import RYZEN from 0x05

// SwapToken contract: Facilitates token swapping between RYZEN and FlowToken
pub contract SwapToken {

    // Store the last swap timestamp for the contract
    pub var lastSwapTimestamp: UFix64
    // Store the last swap timestamp for each user
    pub var userLastSwapTimestamps: {Address: UFix64}

    // Function to swap tokens between RYZEN and FlowToken
    pub fun swapTokens(signer: AuthAccount, swapAmount: UFix64) {

        let RYZENVault = signer.borrow<&RYZEN.Vault>(from: /storage/VaultStorage)
            ?? panic("Could not borrow RYZEN Vault from signer")

        let flowVault = signer.borrow<&FlowToken.Vault>(from: /storage/FlowVault)
            ?? panic("Could not borrow FlowToken Vault from signer")  

        let minterRef = signer.getCapability<&RYZEN.Minter>(/public/Minter).borrow()
            ?? panic("Could not borrow reference to RYZEN Minter")

        let autherVault = signer.getCapability<&FlowToken.Vault{FungibleToken.Balance, FungibleToken.Receiver, FungibleToken.Provider}>(/public/FlowVault).borrow()
            ?? panic("Could not borrow reference to FlowToken Vault")  

        let withdrawnAmount <- flowVault.withdraw(amount: swapAmount)
        autherVault.deposit(from: <-withdrawnAmount)
        
        let userAddress = signer.address
        self.lastSwapTimestamp = self.userLastSwapTimestamps[userAddress] ?? 1.0
        let currentTime = getCurrentBlock().timestamp

        let timeSinceLastSwap = currentTime - self.lastSwapTimestamp
        let mintedAmount = 2.0 * UFix64(timeSinceLastSwap)

        let newRYZENVault <- minterRef.mintToken(amount: mintedAmount)
        RYZENVault.deposit(from: <-newRYZENVault)

        self.userLastSwapTimestamps[userAddress] = timeSinceLastSwap
    }

    // Initialize the contract
    init() {
        // Set default values for last swap timestamp
        self.lastSwapTimestamp = 1.0
        self.userLastSwapTimestamps = {0x05: 1.0}
    }
}