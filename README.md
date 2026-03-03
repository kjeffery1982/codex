# SwagSwap

Native SwiftUI prototype for a two-sided tech swag marketplace where people list extra swag, browse by company or category, trade in internal tokens, and join verified company circles.

## What is in this prototype

- Retro marketplace shell with thick outlines, pastel gradients, and demo-friendly product cards
- Discover marketplace with menu-based filters for category, company, and access type
- Illustrated sample swag for brands like OpenAI, Google, Uber, Box, Netflix, Stripe, and GitHub
- Fixed token pricing for everyday listings
- Vault tab for rare, retro, and auction-style swag
- Sell flow with draft listing fields, pricing, verification prompts, and market selection
- Circles tab for company-specific verified groups
- Wallet tab with mocked token balance, cash-in, cash-out, and activity history

## V1 assumptions baked into the app

- `1 token = $1` placeholder
- Shipping and fulfillment are explicitly out of scope
- Payments, fraud controls, identity checks, and payouts are mocked
- Seller verification is represented through photo proof, listing detail quality, and company circle membership

## Files

- `SwagSwap.xcodeproj`
- `SwagSwap/SwagSwapApp.swift`
- `SwagSwap/ContentView.swift`

## Review flow

1. Open `SwagSwap.xcodeproj` in Xcode.
2. Run the app in an iPhone simulator.
3. Walk through:
   - `Discover` for the main browse and filter flow
   - `Vault` for retro and high-demand drops
   - `Sell` for the supply-side listing flow
   - `Circles` for verified company-only exchanges
   - `Wallet` for the token economy

## Notes

- Source was Swift-typechecked successfully against the iPhone simulator SDK after the redesign.
- Product visuals are drawn in SwiftUI for now; no external generated image assets are required for the prototype.
- Full `xcodebuild` project execution could not be completed in this environment because the local Xcode simulator plugins are not fully initialized. Opening Xcode and completing first-launch setup should resolve that machine-specific issue.
