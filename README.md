Fungible Token Project on the Flow Blockchain

Welcome to the Fungible Token Project repository, a dedicated space for a comprehensive Fungible Token contract implementation on the Flow blockchain. This repository is equipped with a suite of transactions and scripts, meticulously organized into various parts to address different aspects of token management and interactions.

Project Overview:

**Core Contract Implementation**

Contract - FlowToken:

The FlowToken contract introduces essential features such as owner-controlled minting, a Vault resource for managing token balances, and an array of transactions and scripts for robust token management.

Code Insights:

Key highlights include the deposit function within the Vault resource, ensuring secure token transfer and meticulous balance management to prevent double-counting.

**Fundamental Transactions and Scripts**

Transactions:

- MINT: Facilitates token minting to designated recipients.
- SETUP: Streamlines the initialization of a user's vault in account storage.
- TRANSFER: Enables users to transfer tokens to different addresses.

Scripts:

- READ BALANCE: Retrieves the token balance in a user’s vault.
- SETUP VALIDATION: Confirms correct vault setup.
- TOTAL SUPPLY CHECK: Reports the total circulating supply of tokens.

**Transaction and Script Enhancements**

Focus:

Improvements to the SETUP transaction for remedying improperly set up vaults and enhancements to the READ BALANCE script for compatibility with non-standard vault setups.

Key Features:

- Resource identifiers for verifying token types.
- Resource capabilities for vault authenticity validation.

**Contract and Transaction Augmentation**

Admin Capabilities:

Empowers the Admin to withdraw tokens from user vaults and deposit equivalent $FLOW tokens.

New Transaction:

Admin Withdraw and Deposit: Admin-exclusive transaction for token management.

**Advanced Scripting**

Scripts:

- BALANCE SUMMARY: Presents a summary of a user’s $FLOW and custom token vault balances.
- VAULT OVERVIEW: Provides a detailed overview of all recognized Fungible Token vaults in a user’s storage.

**Swap Contract Integration**

Swap Contract:

The Swap contract allows users to exchange $FLOW tokens for custom tokens based on the duration since their last exchange.

Swap Mechanics:

Utilizes a custom identity resource and the user's $FLOW vault reference to authenticate user identity and facilitate secure token swaps.

**Project Conclusion**

This repository showcases a full-fledged Fungible Token contract deployment on the Flow blockchain. It systematically presents functionalities including token minting, vault setup, token transfer, and token swapping for enhanced comprehensibility and ease of navigation.

