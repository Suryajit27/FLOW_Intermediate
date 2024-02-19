import FungibleToken from 0x05
import RYZEN from 0x05

pub fun main(account: Address) {

    // Attempt to borrow PublicVault capability
    let publicVault: &RYZEN.Vault{FungibleToken.Balance, FungibleToken.Receiver, RYZEN.CollectionPublic}? =
        getAccount(account).getCapability(/public/Vault)
            .borrow<&RYZEN.Vault{FungibleToken.Balance, FungibleToken.Receiver, RYZEN.CollectionPublic}>()

    if (publicVault == nil) {
        // Create and link an empty vault if capability is not present
        let newVault <- RYZEN.createEmptyVault()
        getAuthAccount(account).save(<-newVault, to: /storage/VaultStorage)
        getAuthAccount(account).link<&RYZEN.Vault{FungibleToken.Balance, FungibleToken.Receiver, RYZEN.CollectionPublic}>(
            /public/Vault,
            target: /storage/VaultStorage
        )
        log("Empty vault created")
        
        // Borrow the vault capability again to display its balance
        let retrievedVault: &RYZEN.Vault{FungibleToken.Balance}? =
            getAccount(account).getCapability(/public/Vault)
                .borrow<&RYZEN.Vault{FungibleToken.Balance}>()
        log(retrievedVault?.balance)
    } else {
        log("Vault already exists and is properly linked")
        
        // Borrow the vault capability for further checks
        let checkVault: &RYZEN.Vault{FungibleToken.Balance, FungibleToken.Receiver, RYZEN.CollectionPublic} =
            getAccount(account).getCapability(/public/Vault)
                .borrow<&RYZEN.Vault{FungibleToken.Balance, FungibleToken.Receiver, RYZEN.CollectionPublic}>()
                ?? panic("Vault capability not found")
        
        // Check if the vault's UUID is in the list of vaults
        if RYZEN.vaults.contains(checkVault.uuid) {
            log(publicVault?.balance)
            log("This is a RYZEN vault")
        } else {
            log("This is not a RYZEN vault")
        }
    }
}