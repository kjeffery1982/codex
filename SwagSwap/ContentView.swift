import SwiftUI

enum Palette {
    static let paper = Color(red: 0.965, green: 0.97, blue: 0.982)
    static let surface = Color.white
    static let ink = Color(red: 0.09, green: 0.11, blue: 0.16)
    static let blue = Color(red: 0.16, green: 0.4, blue: 0.98)
    static let sky = Color(red: 0.84, green: 0.91, blue: 1.0)
    static let pink = Color(red: 0.98, green: 0.87, blue: 0.94)
    static let orange = Color(red: 1.0, green: 0.66, blue: 0.24)
    static let peach = Color(red: 0.98, green: 0.94, blue: 0.9)
    static let lemon = Color(red: 1.0, green: 0.95, blue: 0.72)
    static let mint = Color(red: 0.82, green: 0.94, blue: 0.88)
    static let coral = Color(red: 0.95, green: 0.62, blue: 0.62)
    static let cream = Color(red: 0.985, green: 0.988, blue: 0.995)
    static let line = Color.black.opacity(0.08)
    static let shadow = Color.black.opacity(0.08)

    static let heroBackground = LinearGradient(
        colors: [Color.white, sky, pink, Color(red: 1.0, green: 0.94, blue: 0.84)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let pageBackground = LinearGradient(
        colors: [paper, Color(red: 0.95, green: 0.97, blue: 1.0)],
        startPoint: .top,
        endPoint: .bottom
    )
}

enum AppTab: Int {
    case discover
    case vault
    case sell
    case circles
    case wallet
}

enum TechBrand: String, CaseIterable, Identifiable {
    case openAI = "OpenAI"
    case google = "Google"
    case uber = "Uber"
    case box = "Box"
    case netflix = "Netflix"
    case stripe = "Stripe"
    case github = "GitHub"

    var id: String { rawValue }

    var wordmark: String {
        switch self {
        case .openAI: return "OPENAI"
        case .google: return "GOOGLE"
        case .uber: return "UBER"
        case .box: return "BOX"
        case .netflix: return "NETFLIX"
        case .stripe: return "STRIPE"
        case .github: return "GITHUB"
        }
    }

    var colors: [Color] {
        switch self {
        case .openAI: return [Palette.blue, Palette.sky]
        case .google: return [Color(red: 0.21, green: 0.42, blue: 0.95), Color(red: 0.93, green: 0.27, blue: 0.24), Color(red: 0.97, green: 0.77, blue: 0.21), Color(red: 0.2, green: 0.67, blue: 0.32)]
        case .uber: return [Palette.ink, Palette.mint]
        case .box: return [Palette.blue, Palette.sky]
        case .netflix: return [Palette.coral, Palette.orange]
        case .stripe: return [Color(red: 0.43, green: 0.44, blue: 0.98), Palette.sky]
        case .github: return [Palette.ink, Palette.lemon]
        }
    }
}

enum SwagCategory: String, CaseIterable, Identifiable {
    case stickers = "Stickers"
    case tshirt = "T-Shirt"
    case hoodie = "Hoodie"
    case jacket = "Jacket"
    case notebook = "Notebook"
    case bottle = "Bottle"
    case bundle = "Bundle"

    var id: String { rawValue }

    var symbol: String {
        switch self {
        case .stickers: return "seal.fill"
        case .tshirt: return "tshirt.fill"
        case .hoodie: return "square.stack.3d.up.fill"
        case .jacket: return "shield.fill"
        case .notebook: return "book.closed.fill"
        case .bottle: return "cup.and.saucer.fill"
        case .bundle: return "shippingbox.fill"
        }
    }

    var defaultTokens: Int {
        switch self {
        case .stickers: return 1
        case .tshirt: return 10
        case .hoodie: return 25
        case .jacket: return 50
        case .notebook: return 8
        case .bottle: return 7
        case .bundle: return 35
        }
    }
}

enum ListingIntent: String, CaseIterable, Identifiable {
    case tokenSale = "Token sale"
    case swapOnly = "Swap only"
    case tokenOrSwap = "Token or swap"

    var id: String { rawValue }
}

enum ListingCondition: String, CaseIterable, Identifiable {
    case mint = "Mint"
    case excellent = "Excellent"
    case great = "Great"
    case vintage = "Retro used"

    var id: String { rawValue }
}

enum AccessFilter: String, CaseIterable, Identifiable {
    case all = "All access"
    case publicMarket = "Public market"
    case verifiedCircles = "Verified circles"
    case retroOnly = "Retro only"

    var id: String { rawValue }
}

enum DraftMarket: String, CaseIterable, Identifiable {
    case publicMarket = "Public market"
    case verifiedCircle = "Verified company circle"

    var id: String { rawValue }
}

enum ArtStyle: String {
    case openAIStickerSheet
    case googleNotebook
    case uberHoodie
    case boxJacket
    case netflixJurassicTee
    case githubStickerPack
    case stripeConferenceTee
    case googleBottle
    case openAINotebook
    case boxStickerSheet
    case openAIResearchJacket
    case githubNotebook
    case stripeBottle
    case googleStickerSheet
    case openAIBundleBox
}

struct Listing: Identifiable {
    let id = UUID()
    let title: String
    let company: TechBrand
    let category: SwagCategory
    let tokenPrice: Int
    let intent: ListingIntent
    let condition: ListingCondition
    let size: String
    let description: String
    let sellerName: String
    let sellerRole: String
    let location: String
    let verifiedPhotos: Int
    let demand: String
    let year: String
    let isFeatured: Bool
    let isRetro: Bool
    let circleName: String?
    let art: ArtStyle
}

struct AuctionLot: Identifiable {
    let id = UUID()
    let title: String
    let company: TechBrand
    let currentBid: Int
    let buyNow: Int
    let endsIn: String
    let watchers: Int
    let story: String
    let art: ArtStyle
}

struct CompanyCircle: Identifiable {
    let id = UUID()
    let brand: TechBrand
    let name: String
    let memberCount: Int
    let liveListings: Int
    let requirement: String
    let accessNote: String
    let isMember: Bool
}

struct WalletEntry: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let amount: Int
    let kind: EntryKind

    enum EntryKind {
        case credit
        case debit
        case pending

        var color: Color {
            switch self {
            case .credit: return Palette.mint
            case .debit: return Palette.coral
            case .pending: return Palette.orange
            }
        }

        var prefix: String {
            switch self {
            case .credit: return "+"
            case .debit: return "-"
            case .pending: return "•"
            }
        }
    }
}

enum WalletProvider: String, CaseIterable, Identifiable {
    case stripe = "Stripe"
    case venmo = "Venmo"
    case bank = "Bank account"

    var id: String { rawValue }

    var subtitle: String {
        switch self {
        case .stripe: return "Buy tokens with a card or Link checkout."
        case .venmo: return "Cash out to your Venmo handle for lightweight seller payouts."
        case .bank: return "Primary settlement rail for larger balances."
        }
    }

    var symbol: String {
        switch self {
        case .stripe: return "creditcard.fill"
        case .venmo: return "arrow.left.arrow.right.circle.fill"
        case .bank: return "building.columns.fill"
        }
    }
}

struct VerificationStep: Identifiable {
    let id = UUID()
    let title: String
    let detail: String
}

enum SeedData {
    static let circles: [CompanyCircle] = [
        CompanyCircle(
            brand: .openAI,
            name: "OpenAI Verified Closet",
            memberCount: 84,
            liveListings: 18,
            requirement: "Verify with @openai.com email or internal badge screenshot.",
            accessNote: "Members can reserve company swag before it hits the public feed.",
            isMember: true
        ),
        CompanyCircle(
            brand: .google,
            name: "Google Gear Exchange",
            memberCount: 132,
            liveListings: 27,
            requirement: "Google workspace email plus a current campus badge photo.",
            accessNote: "Best for event drops, I/O swag, and internal team merch.",
            isMember: false
        ),
        CompanyCircle(
            brand: .uber,
            name: "Uber Ops Swap",
            memberCount: 58,
            liveListings: 11,
            requirement: "Verify with corporate email and delivery or HQ badge proof.",
            accessNote: "Useful for city-ops jackets, launch shirts, and team hoodies.",
            isMember: false
        ),
        CompanyCircle(
            brand: .box,
            name: "Box Blue Room",
            memberCount: 39,
            liveListings: 9,
            requirement: "Need company email and one tagged swag photo to enter.",
            accessNote: "Great for conference jackets and early-company throwbacks.",
            isMember: false
        ),
        CompanyCircle(
            brand: .netflix,
            name: "Netflix Retro Club",
            memberCount: 24,
            liveListings: 6,
            requirement: "Legacy email or recruiter-assisted verification for alumni.",
            accessNote: "Focused on rare hackathon and culture merch from earlier eras.",
            isMember: false
        )
    ]

    static let listings: [Listing] = [
        Listing(
            title: "Research Sticker Sheet",
            company: .openAI,
            category: .stickers,
            tokenPrice: 1,
            intent: .tokenOrSwap,
            condition: .mint,
            size: "Sticker pack",
            description: "Layered sheet with research marks, launch week icons, and a holographic notebook seal.",
            sellerName: "Maya R.",
            sellerRole: "Field seller",
            location: "San Francisco",
            verifiedPhotos: 4,
            demand: "Starter trade",
            year: "2025",
            isFeatured: true,
            isRetro: false,
            circleName: "OpenAI Verified Closet",
            art: .openAIStickerSheet
        ),
        Listing(
            title: "Cloud Campus Notebook",
            company: .google,
            category: .notebook,
            tokenPrice: 8,
            intent: .tokenSale,
            condition: .excellent,
            size: "A5",
            description: "Hardcover notebook with graph paper, color tabs, and a retro campus grid cover.",
            sellerName: "Elena B.",
            sellerRole: "Partnerships",
            location: "Mountain View",
            verifiedPhotos: 5,
            demand: "Easy gift",
            year: "2024",
            isFeatured: true,
            isRetro: false,
            circleName: "Google Gear Exchange",
            art: .googleNotebook
        ),
        Listing(
            title: "Late Shift Ops Hoodie",
            company: .uber,
            category: .hoodie,
            tokenPrice: 25,
            intent: .tokenOrSwap,
            condition: .great,
            size: "XL",
            description: "Heavy black hoodie with big UBER OPS back print and sleeve route tape.",
            sellerName: "Jordan L.",
            sellerRole: "Solutions engineer",
            location: "Austin",
            verifiedPhotos: 6,
            demand: "Popular size",
            year: "2023",
            isFeatured: true,
            isRetro: false,
            circleName: "Uber Ops Swap",
            art: .uberHoodie
        ),
        Listing(
            title: "Blue Room Summit Jacket",
            company: .box,
            category: .jacket,
            tokenPrice: 50,
            intent: .tokenSale,
            condition: .excellent,
            size: "M",
            description: "Soft-shell jacket with conference embroidery and oversized anniversary patch.",
            sellerName: "Ari S.",
            sellerRole: "Enterprise AE",
            location: "Redwood City",
            verifiedPhotos: 6,
            demand: "Collectors watching",
            year: "2022",
            isFeatured: true,
            isRetro: false,
            circleName: "Box Blue Room",
            art: .boxJacket
        ),
        Listing(
            title: "Hackathon 2012 Jurassic Stack Tee",
            company: .netflix,
            category: .tshirt,
            tokenPrice: 18,
            intent: .tokenOrSwap,
            condition: .vintage,
            size: "L",
            description: "Deep cut hackathon tee riffing on Jurassic Park with a dino skeleton made of old service names.",
            sellerName: "Chris D.",
            sellerRole: "Former platform engineer",
            location: "Los Angeles",
            verifiedPhotos: 7,
            demand: "Retro heat",
            year: "2012",
            isFeatured: true,
            isRetro: true,
            circleName: "Netflix Retro Club",
            art: .netflixJurassicTee
        ),
        Listing(
            title: "Octocat Sticker Drop",
            company: .github,
            category: .stickers,
            tokenPrice: 2,
            intent: .tokenSale,
            condition: .mint,
            size: "Five pack",
            description: "Classic octocat sticker pack with issue tracker joke stickers mixed in.",
            sellerName: "Rae M.",
            sellerRole: "Developer advocate",
            location: "Remote",
            verifiedPhotos: 4,
            demand: "Quick pickup",
            year: "2021",
            isFeatured: false,
            isRetro: true,
            circleName: nil,
            art: .githubStickerPack
        ),
        Listing(
            title: "Developer Economy Tee",
            company: .stripe,
            category: .tshirt,
            tokenPrice: 10,
            intent: .tokenSale,
            condition: .excellent,
            size: "L",
            description: "Conference tee with gradient print and tiny payment rail callouts on the back hem.",
            sellerName: "Tina K.",
            sellerRole: "Platform PM",
            location: "Seattle",
            verifiedPhotos: 4,
            demand: "Clean flex",
            year: "2024",
            isFeatured: false,
            isRetro: false,
            circleName: nil,
            art: .stripeConferenceTee
        ),
        Listing(
            title: "Campus Signal Bottle",
            company: .google,
            category: .bottle,
            tokenPrice: 7,
            intent: .swapOnly,
            condition: .great,
            size: "24 oz",
            description: "Bright bottle with sticker-safe finish and old shuttle route icons.",
            sellerName: "Min T.",
            sellerRole: "Customer success",
            location: "Chicago",
            verifiedPhotos: 3,
            demand: "Swap bait",
            year: "2025",
            isFeatured: false,
            isRetro: false,
            circleName: nil,
            art: .googleBottle
        ),
        Listing(
            title: "Alignment Notes Journal",
            company: .openAI,
            category: .notebook,
            tokenPrice: 8,
            intent: .tokenOrSwap,
            condition: .mint,
            size: "B6",
            description: "Limited notebook run with bold edge paint and an internal prompt card.",
            sellerName: "Noah F.",
            sellerRole: "AE",
            location: "New York",
            verifiedPhotos: 4,
            demand: "Desk candy",
            year: "2025",
            isFeatured: false,
            isRetro: false,
            circleName: "OpenAI Verified Closet",
            art: .openAINotebook
        ),
        Listing(
            title: "Archive Sticker Envelope",
            company: .box,
            category: .stickers,
            tokenPrice: 1,
            intent: .tokenSale,
            condition: .mint,
            size: "Envelope",
            description: "Tiny sticker envelope with old Box mascots, cloud icons, and launch slogans.",
            sellerName: "Lexi P.",
            sellerRole: "Design ops",
            location: "Los Angeles",
            verifiedPhotos: 4,
            demand: "Cute throw-in",
            year: "2020",
            isFeatured: false,
            isRetro: true,
            circleName: nil,
            art: .boxStickerSheet
        ),
        Listing(
            title: "Research Field Jacket",
            company: .openAI,
            category: .jacket,
            tokenPrice: 46,
            intent: .tokenOrSwap,
            condition: .excellent,
            size: "L",
            description: "Structured twill jacket with a tonal research patch, contrast lining, and a tiny notebook icon stitched on the cuff.",
            sellerName: "Priya C.",
            sellerRole: "Go-to-market",
            location: "San Francisco",
            verifiedPhotos: 5,
            demand: "Quiet flex",
            year: "2025",
            isFeatured: false,
            isRetro: false,
            circleName: "OpenAI Verified Closet",
            art: .openAIResearchJacket
        ),
        Listing(
            title: "Ship Log Notebook",
            company: .github,
            category: .notebook,
            tokenPrice: 9,
            intent: .tokenSale,
            condition: .mint,
            size: "A5",
            description: "Soft-touch notebook with commit graph endpapers and octocat stamp marks along the page edge.",
            sellerName: "Vince A.",
            sellerRole: "Engineer relations",
            location: "Remote",
            verifiedPhotos: 4,
            demand: "Desk upgrade",
            year: "2024",
            isFeatured: false,
            isRetro: false,
            circleName: nil,
            art: .githubNotebook
        ),
        Listing(
            title: "Payments Launch Bottle",
            company: .stripe,
            category: .bottle,
            tokenPrice: 8,
            intent: .tokenSale,
            condition: .excellent,
            size: "20 oz",
            description: "Slim metal bottle with layered rails graphics, lavender cap, and a matte event finish.",
            sellerName: "Dani W.",
            sellerRole: "Product marketing",
            location: "Dublin",
            verifiedPhotos: 4,
            demand: "Conference pull",
            year: "2025",
            isFeatured: false,
            isRetro: false,
            circleName: nil,
            art: .stripeBottle
        ),
        Listing(
            title: "I/O Icon Sticker Sheet",
            company: .google,
            category: .stickers,
            tokenPrice: 2,
            intent: .swapOnly,
            condition: .mint,
            size: "Sheet",
            description: "Die-cut icon sheet with shuttle arrows, campus map pins, and old keynote doodles.",
            sellerName: "Sara N.",
            sellerRole: "Developer relations",
            location: "Sunnyvale",
            verifiedPhotos: 3,
            demand: "Easy add-on",
            year: "2025",
            isFeatured: false,
            isRetro: false,
            circleName: "Google Gear Exchange",
            art: .googleStickerSheet
        ),
        Listing(
            title: "Starter Closet Bundle",
            company: .openAI,
            category: .bundle,
            tokenPrice: 35,
            intent: .tokenOrSwap,
            condition: .excellent,
            size: "Mixed",
            description: "Notebook, bottle, and research sticker extras bundled together for a first closet clean-out.",
            sellerName: "Ava J.",
            sellerRole: "Sales",
            location: "New York",
            verifiedPhotos: 6,
            demand: "Bundle value",
            year: "2026",
            isFeatured: false,
            isRetro: false,
            circleName: "OpenAI Verified Closet",
            art: .openAIBundleBox
        )
    ]

    static let auctions: [AuctionLot] = [
        AuctionLot(
            title: "Netflix Hackathon 2012 Tee",
            company: .netflix,
            currentBid: 42,
            buyNow: 78,
            endsIn: "7h 18m",
            watchers: 63,
            story: "Jurassic-themed internal hackathon shirt with real cult energy among ex-employees.",
            art: .netflixJurassicTee
        ),
        AuctionLot(
            title: "OpenAI Research Jacket Prototype",
            company: .openAI,
            currentBid: 88,
            buyNow: 148,
            endsIn: "1d 2h",
            watchers: 51,
            story: "Not public merch. Best kept in a controlled auction lane with verification.",
            art: .boxJacket
        ),
        AuctionLot(
            title: "Google Campus Creator Bundle",
            company: .google,
            currentBid: 35,
            buyNow: 59,
            endsIn: "4h 50m",
            watchers: 27,
            story: "Notebook, bottle, and campus-only sticker set bundled for a nostalgia buyer.",
            art: .googleNotebook
        )
    ]

    static let walletEntries: [WalletEntry] = [
        WalletEntry(title: "Sold Uber Ops Hoodie", subtitle: "Pending release after trust window", amount: 25, kind: .pending),
        WalletEntry(title: "Bought OpenAI stickers", subtitle: "Matched with Maya R.", amount: 1, kind: .debit),
        WalletEntry(title: "Added tokens", subtitle: "Demo top-up from card", amount: 40, kind: .credit),
        WalletEntry(title: "Notebook sold", subtitle: "Public market payout", amount: 8, kind: .credit)
    ]

    static let verificationSteps: [VerificationStep] = [
        VerificationStep(title: "Front hero photo", detail: "Capture the full item in clean light so it feels resale-ready."),
        VerificationStep(title: "Logo or event close-up", detail: "Show the exact company mark, event patch, or hackathon artwork."),
        VerificationStep(title: "Tag or proof card", detail: "Add size tags, interior labels, or a handwritten date card for trust."),
        VerificationStep(title: "Circle proof when needed", detail: "Verified company circles require company email or badge confirmation.")
    ]
}

final class MarketplaceViewModel: ObservableObject {
    @Published var selectedTab: AppTab = .discover
    @Published var searchText = ""
    @Published var selectedCategory: SwagCategory?
    @Published var selectedBrand: TechBrand?
    @Published var accessFilter: AccessFilter = .all
    @Published var selectedListing: Listing?
    @Published var selectedAuction: AuctionLot?
    @Published var selectedCircle: CompanyCircle?

    @Published var draftBrand: TechBrand = .openAI
    @Published var draftCategory: SwagCategory = .tshirt
    @Published var draftCondition: ListingCondition = .excellent
    @Published var draftIntent: ListingIntent = .tokenOrSwap
    @Published var draftMarket: DraftMarket = .publicMarket
    @Published var draftCircleBrand: TechBrand = .openAI
    @Published var draftTitle = "Field Kickoff Tee"
    @Published var draftSize = "L"
    @Published var draftAskTokens = 10
    @Published var draftNotes = "Clean extra swag from kickoff season. Ready for another operator, seller, or engineer."
    @Published var justCreatedDraft = false

    @Published var walletBalance = 138
    @Published var exchangeAmount = 25.0
    @Published var isBuyingTokens = true
    @Published var connectedFundingProvider: WalletProvider? = .stripe
    @Published var connectedPayoutProvider: WalletProvider? = .venmo
    @Published var stripeCheckoutReady = true
    @Published var venmoPayoutReady = false

    let listings = SeedData.listings
    let auctions = SeedData.auctions
    let circles = SeedData.circles
    let walletEntries = SeedData.walletEntries
    let verificationSteps = SeedData.verificationSteps

    var filteredListings: [Listing] {
        listings.filter { listing in
            let searchMatch = searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
                [
                    listing.title,
                    listing.company.rawValue,
                    listing.description,
                    listing.demand,
                    listing.circleName ?? ""
                ].joined(separator: " ").localizedCaseInsensitiveContains(searchText)

            let categoryMatch = selectedCategory == nil || listing.category == selectedCategory
            let brandMatch = selectedBrand == nil || listing.company == selectedBrand
            let accessMatch: Bool
            switch accessFilter {
            case .all:
                accessMatch = true
            case .publicMarket:
                accessMatch = listing.circleName == nil
            case .verifiedCircles:
                accessMatch = listing.circleName != nil
            case .retroOnly:
                accessMatch = listing.isRetro
            }

            return searchMatch && categoryMatch && brandMatch && accessMatch
        }
    }

    var featuredListings: [Listing] {
        listings.filter(\.isFeatured)
    }

    var draftSuggestedTokens: Int {
        draftCategory.defaultTokens
    }

    var draftCircleName: String {
        circles.first(where: { $0.brand == draftCircleBrand })?.name ?? "Verified circle"
    }

    var draftArt: ArtStyle {
        switch (draftBrand, draftCategory) {
        case (.openAI, .stickers): return .openAIStickerSheet
        case (.openAI, .notebook): return .openAINotebook
        case (.openAI, .jacket): return .openAIResearchJacket
        case (.openAI, .bundle): return .openAIBundleBox
        case (.google, .notebook): return .googleNotebook
        case (.google, .bottle): return .googleBottle
        case (.google, .stickers): return .googleStickerSheet
        case (.uber, .hoodie): return .uberHoodie
        case (.box, .jacket): return .boxJacket
        case (.box, .stickers): return .boxStickerSheet
        case (.netflix, .tshirt): return .netflixJurassicTee
        case (.github, .notebook): return .githubNotebook
        case (.github, .stickers): return .githubStickerPack
        case (.stripe, .bottle): return .stripeBottle
        case (.stripe, .tshirt): return .stripeConferenceTee
        case (_, .tshirt): return .stripeConferenceTee
        case (_, .hoodie): return .uberHoodie
        case (_, .jacket): return .boxJacket
        case (_, .notebook): return .googleNotebook
        case (_, .bottle): return .googleBottle
        case (_, .bundle): return .openAIBundleBox
        default: return .openAIStickerSheet
        }
    }

    func createDraft() {
        justCreatedDraft = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            self.justCreatedDraft = false
        }
    }

    func connectFunding(_ provider: WalletProvider) {
        connectedFundingProvider = provider
        if provider == .stripe {
            stripeCheckoutReady = true
        }
    }

    func connectPayout(_ provider: WalletProvider) {
        connectedPayoutProvider = provider
        if provider == .venmo {
            venmoPayoutReady = true
        }
    }
}

struct ContentView: View {
    @StateObject private var model = MarketplaceViewModel()

    var body: some View {
        ZStack {
            Palette.pageBackground.ignoresSafeArea()

            Group {
                switch model.selectedTab {
                case .discover:
                    DiscoverView(model: model)
                case .vault:
                    VaultView(model: model)
                case .sell:
                    SellView(model: model)
                case .circles:
                    CirclesView(model: model)
                case .wallet:
                    WalletView(model: model)
                }
            }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            BottomTabBar(selectedTab: $model.selectedTab)
                .padding(.horizontal, 14)
                .padding(.top, 6)
                .padding(.bottom, 6)
        }
        .sheet(item: $model.selectedListing) { listing in
            ListingDetailSheet(listing: listing)
                .presentationDetents([.medium, .large])
        }
        .sheet(item: $model.selectedAuction) { lot in
            AuctionDetailSheet(lot: lot)
                .presentationDetents([.medium, .large])
        }
    }
}

struct DiscoverView: View {
    @ObservedObject var model: MarketplaceViewModel
    private let productColumns = [
        GridItem(.adaptive(minimum: 158), spacing: 14, alignment: .top)
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                Palette.pageBackground.ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 18) {
                        hero
                        commerceStats
                        featuredSection
                        filters
                        listingsSection
                    }
                    .padding(.horizontal, 18)
                    .padding(.top, 12)
                    .padding(.bottom, 18)
                }
                .scrollIndicators(.hidden)
            }
            .navigationTitle("SwagSwap")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    TokenBadge(tokens: model.walletBalance)
                }
            }
        }
    }

    private var hero: some View {
        RetroCard(fill: Palette.heroBackground) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Buy and swap verified tech swag")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundStyle(Palette.ink)
                    .fixedSize(horizontal: false, vertical: true)

                Text("Discover fixed-price team merch, company closet clean-outs, and verified circle drops. Use Vault when the item is rare enough to bid on.")
                    .font(.system(.body, design: .rounded, weight: .medium))
                    .foregroundStyle(Palette.ink.opacity(0.72))

                HStack(spacing: 10) {
                    MiniFact(text: "\(model.filteredListings.count) live listings")
                    MiniFact(text: "\(model.circles.count) verified circles")
                    MiniFact(text: "Fixed-price market")
                }

                HStack(spacing: 12) {
                    RetroButton(title: "Shop now", tint: Palette.blue) {
                        model.selectedTab = .discover
                    }
                    RetroButton(title: "Sell something", tint: Palette.paper, textColor: Palette.blue) {
                        model.selectedTab = .sell
                    }
                }
            }
        }
    }

    private var commerceStats: some View {
        HStack(spacing: 12) {
            CommerceStatCard(value: "4.9/5", label: "seller trust")
            CommerceStatCard(value: "24h", label: "avg. match time")
            CommerceStatCard(value: "1 token", label: "starts at $1")
        }
    }

    private var filters: some View {
        RetroCard {
            VStack(alignment: .leading, spacing: 14) {
                Text("Browse filters")
                    .font(.system(.headline, design: .rounded, weight: .black))
                    .foregroundStyle(Palette.ink)

                HStack(spacing: 10) {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(Palette.blue)
                    TextField("Search company, swag item, or vibe", text: $model.searchText)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                }
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(Palette.cream)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .stroke(Palette.ink, lineWidth: 2)
                )

                VStack(spacing: 10) {
                    HStack(spacing: 10) {
                        categoryMenu
                        brandMenu
                    }
                    HStack(spacing: 10) {
                        accessMenu
                        Button {
                            model.selectedCategory = nil
                            model.selectedBrand = nil
                            model.accessFilter = .all
                            model.searchText = ""
                        } label: {
                            FilterFieldLabel(title: "Reset", value: "Clear filters")
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }

    private var categoryMenu: some View {
        Menu {
            Button("All categories") { model.selectedCategory = nil }
            ForEach(SwagCategory.allCases) { category in
                Button(category.rawValue) { model.selectedCategory = category }
            }
        } label: {
            FilterFieldLabel(title: "Category", value: model.selectedCategory?.rawValue ?? "All categories")
        }
    }

    private var brandMenu: some View {
        Menu {
            Button("All companies") { model.selectedBrand = nil }
            ForEach(TechBrand.allCases) { brand in
                Button(brand.rawValue) { model.selectedBrand = brand }
            }
        } label: {
            FilterFieldLabel(title: "Company", value: model.selectedBrand?.rawValue ?? "All companies")
        }
    }

    private var accessMenu: some View {
        Menu {
            ForEach(AccessFilter.allCases) { filter in
                Button(filter.rawValue) { model.accessFilter = filter }
            }
        } label: {
            FilterFieldLabel(title: "Access", value: model.accessFilter.rawValue)
        }
    }

    private var featuredSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Featured drops")
                    .font(.system(.title3, design: .rounded, weight: .bold))
                    .foregroundStyle(Palette.ink)
                Spacer()
                Text("Trending now")
                    .font(.system(.footnote, design: .rounded, weight: .bold))
                    .foregroundStyle(Palette.blue)
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 14) {
                    ForEach(model.featuredListings) { listing in
                        FeaturedListingRow(listing: listing)
                            .frame(width: 276)
                            .onTapGesture {
                                model.selectedListing = listing
                            }
                    }
                }
                .padding(.vertical, 2)
            }
        }
    }

    private var listingsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("All listings")
                    .font(.system(.title3, design: .rounded, weight: .bold))
                    .foregroundStyle(Palette.ink)
                Spacer()
                Text("\(model.filteredListings.count) listings")
                    .font(.system(.footnote, design: .rounded, weight: .bold))
                    .foregroundStyle(Palette.blue)
            }

            LazyVGrid(columns: productColumns, spacing: 14) {
                ForEach(model.filteredListings) { listing in
                    ProductTile(listing: listing)
                        .onTapGesture {
                            model.selectedListing = listing
                        }
                }
            }
        }
    }
}

struct VaultView: View {
    @ObservedObject var model: MarketplaceViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                Palette.pageBackground.ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 18) {
                        RetroCard(fill: LinearGradient(colors: [Palette.surface, Palette.peach, Palette.sky], startPoint: .topLeading, endPoint: .bottomTrailing)) {
                            VStack(alignment: .leading, spacing: 14) {
                                Text("Vault auctions and buy now")
                                    .font(.system(size: 28, weight: .bold, design: .rounded))
                                    .foregroundStyle(Palette.ink)
                                Text("Vault is for exclusive inventory, alumni grails, and high-demand pieces. Buyers can bid eBay-style or use a buy-now price when a seller wants instant conversion.")
                                    .font(.system(.body, design: .rounded, weight: .medium))
                                    .foregroundStyle(Palette.ink.opacity(0.72))
                                HStack(spacing: 10) {
                                    MiniFact(text: "Live bidding")
                                    MiniFact(text: "Buy now option")
                                    MiniFact(text: "Exclusive stock")
                                }
                            }
                        }

                        ForEach(model.auctions) { lot in
                            AuctionRow(lot: lot)
                                .onTapGesture {
                                    model.selectedAuction = lot
                                }
                        }
                    }
                    .padding(.horizontal, 18)
                    .padding(.top, 12)
                    .padding(.bottom, 18)
                }
            }
            .navigationTitle("Vault")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SellView: View {
    @ObservedObject var model: MarketplaceViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                Palette.pageBackground.ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 18) {
                        RetroCard(fill: Palette.heroBackground) {
                            VStack(alignment: .leading, spacing: 14) {
                                Text("List swag with proof.")
                                    .font(.system(size: 30, weight: .black, design: .rounded))
                                    .foregroundStyle(Palette.ink)
                                Text("Prototype the supply side with strong pricing defaults and trust signals before solving fulfillment.")
                                    .font(.system(.body, design: .rounded, weight: .medium))
                                    .foregroundStyle(Palette.ink.opacity(0.86))
                            }
                        }

                        RetroCard {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Draft a listing")
                                    .font(.system(.headline, design: .rounded, weight: .black))
                                    .foregroundStyle(Palette.ink)

                                TextFieldField(title: "Title", text: $model.draftTitle)
                                brandDraftMenu
                                categoryDraftMenu

                                HStack(spacing: 10) {
                                    conditionDraftMenu
                                    intentDraftMenu
                                }

                                HStack(spacing: 10) {
                                    TextFieldField(title: "Size", text: $model.draftSize)
                                    StepperField(title: "Ask", value: $model.draftAskTokens)
                                }

                                marketDraftMenu

                                if model.draftMarket == .verifiedCircle {
                                    circleDraftMenu
                                }

                                NotesField(text: $model.draftNotes)

                                HStack(spacing: 10) {
                                    MiniFact(text: "Suggested: \(model.draftSuggestedTokens) tokens")
                                    MiniFact(text: model.draftMarket == .verifiedCircle ? "Circle-only" : "Public market")
                                }

                                RetroButton(
                                    title: model.justCreatedDraft ? "Draft ready" : "Create draft listing",
                                    tint: model.justCreatedDraft ? Palette.mint : Palette.blue
                                ) {
                                    model.createDraft()
                                }
                            }
                        }

                        RetroCard {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Verification checklist")
                                    .font(.system(.headline, design: .rounded, weight: .black))
                                    .foregroundStyle(Palette.ink)
                                ForEach(model.verificationSteps) { step in
                                    BulletLine(title: step.title, detail: step.detail)
                                }
                            }
                        }

                        RetroCard {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Listing preview")
                                    .font(.system(.headline, design: .rounded, weight: .black))
                                    .foregroundStyle(Palette.ink)
                                ListingRow(listing: draftListing)
                            }
                        }
                    }
                    .padding(.horizontal, 18)
                    .padding(.top, 12)
                    .padding(.bottom, 18)
                }
            }
            .navigationTitle("List")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var brandDraftMenu: some View {
        Menu {
            ForEach(TechBrand.allCases) { brand in
                Button(brand.rawValue) { model.draftBrand = brand }
            }
        } label: {
            FilterFieldLabel(title: "Brand", value: model.draftBrand.rawValue)
        }
    }

    private var categoryDraftMenu: some View {
        Menu {
            ForEach(SwagCategory.allCases) { category in
                Button(category.rawValue) {
                    model.draftCategory = category
                    if model.draftAskTokens < category.defaultTokens {
                        model.draftAskTokens = category.defaultTokens
                    }
                }
            }
        } label: {
            FilterFieldLabel(title: "Category", value: model.draftCategory.rawValue)
        }
    }

    private var conditionDraftMenu: some View {
        Menu {
            ForEach(ListingCondition.allCases) { condition in
                Button(condition.rawValue) { model.draftCondition = condition }
            }
        } label: {
            FilterFieldLabel(title: "Condition", value: model.draftCondition.rawValue)
        }
    }

    private var intentDraftMenu: some View {
        Menu {
            ForEach(ListingIntent.allCases) { intent in
                Button(intent.rawValue) { model.draftIntent = intent }
            }
        } label: {
            FilterFieldLabel(title: "Intent", value: model.draftIntent.rawValue)
        }
    }

    private var marketDraftMenu: some View {
        Menu {
            ForEach(DraftMarket.allCases) { market in
                Button(market.rawValue) { model.draftMarket = market }
            }
        } label: {
            FilterFieldLabel(title: "Access", value: model.draftMarket.rawValue)
        }
    }

    private var circleDraftMenu: some View {
        Menu {
            ForEach(model.circles) { circle in
                Button(circle.name) { model.draftCircleBrand = circle.brand }
            }
        } label: {
            FilterFieldLabel(title: "Circle", value: model.draftCircleName)
        }
    }

    private var draftListing: Listing {
        Listing(
            title: model.draftTitle,
            company: model.draftBrand,
            category: model.draftCategory,
            tokenPrice: model.draftAskTokens,
            intent: model.draftIntent,
            condition: model.draftCondition,
            size: model.draftSize,
            description: model.draftNotes,
            sellerName: "You",
            sellerRole: "Seller preview",
            location: "Your city",
            verifiedPhotos: 4,
            demand: "Draft preview",
            year: "2026",
            isFeatured: false,
            isRetro: false,
            circleName: model.draftMarket == .verifiedCircle ? model.draftCircleName : nil,
            art: model.draftArt
        )
    }
}

struct CirclesView: View {
    @ObservedObject var model: MarketplaceViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                Palette.pageBackground.ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 18) {
                        RetroCard(fill: LinearGradient(colors: [Palette.sky, Palette.pink, Palette.paper], startPoint: .topLeading, endPoint: .bottomTrailing)) {
                            VStack(alignment: .leading, spacing: 14) {
                                Text("Verified company circles")
                                    .font(.system(size: 30, weight: .black, design: .rounded))
                                    .foregroundStyle(Palette.ink)
                                Text("Employees and alumni can unlock private swap lanes for company-specific swag that should not land in the public feed first.")
                                    .font(.system(.body, design: .rounded, weight: .medium))
                                    .foregroundStyle(Palette.ink.opacity(0.86))
                            }
                        }

                        ForEach(model.circles) { circle in
                            CircleRow(circle: circle)
                        }
                    }
                    .padding(.horizontal, 18)
                    .padding(.top, 12)
                    .padding(.bottom, 18)
                }
            }
            .navigationTitle("Circles")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct WalletView: View {
    @ObservedObject var model: MarketplaceViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                Palette.pageBackground.ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 18) {
                        RetroCard(fill: LinearGradient(colors: [Palette.surface, Palette.sky, Palette.surface], startPoint: .topLeading, endPoint: .bottomTrailing)) {
                            VStack(alignment: .leading, spacing: 14) {
                                Text("Wallet and payouts")
                                    .font(.system(size: 28, weight: .bold, design: .rounded))
                                    .foregroundStyle(Palette.ink)
                                Text("\(model.walletBalance) tokens")
                                    .font(.system(size: 40, weight: .bold, design: .rounded))
                                    .foregroundStyle(Palette.ink)
                                Text("Buy tokens for marketplace purchases, keep proceeds in-app, and connect payout rails before launch.")
                                    .font(.system(.body, design: .rounded, weight: .medium))
                                    .foregroundStyle(Palette.ink.opacity(0.72))

                                HStack(spacing: 10) {
                                    MiniFact(text: "1 token = $1")
                                    MiniFact(text: model.connectedFundingProvider?.rawValue ?? "No funding rail")
                                    MiniFact(text: model.connectedPayoutProvider?.rawValue ?? "No payout rail")
                                }
                            }
                        }

                        RetroCard {
                            VStack(alignment: .leading, spacing: 14) {
                                Text("Funding and cash out")
                                    .font(.system(.headline, design: .rounded, weight: .bold))
                                    .foregroundStyle(Palette.ink)

                                ProviderConnectionRow(
                                    provider: .stripe,
                                    title: "Buy tokens with Stripe",
                                    detail: "Use Stripe Checkout or Payment Sheet for cards, Apple Pay, and Link.",
                                    status: model.connectedFundingProvider == .stripe ? "Connected" : "Recommended",
                                    isActive: model.connectedFundingProvider == .stripe
                                ) {
                                    model.connectFunding(.stripe)
                                }

                                ProviderConnectionRow(
                                    provider: .venmo,
                                    title: "Cash out with Venmo",
                                    detail: "Attach a Venmo payout destination for lightweight seller withdrawals.",
                                    status: model.connectedPayoutProvider == .venmo ? "Connected" : "Available",
                                    isActive: model.connectedPayoutProvider == .venmo
                                ) {
                                    model.connectPayout(.venmo)
                                }

                                ProviderConnectionRow(
                                    provider: .bank,
                                    title: "Backup bank account",
                                    detail: "Keep a settlement rail for larger balances and future seller payouts.",
                                    status: model.connectedFundingProvider == .bank || model.connectedPayoutProvider == .bank ? "Connected" : "Optional",
                                    isActive: model.connectedFundingProvider == .bank || model.connectedPayoutProvider == .bank
                                ) {
                                    model.connectFunding(.bank)
                                    model.connectPayout(.bank)
                                }
                            }
                        }

                        RetroCard {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Preview token flow")
                                    .font(.system(.headline, design: .rounded, weight: .bold))
                                    .foregroundStyle(Palette.ink)

                                Picker("Direction", selection: $model.isBuyingTokens) {
                                    Text("Buy tokens").tag(true)
                                    Text("Cash out").tag(false)
                                }
                                .pickerStyle(.segmented)

                                HStack {
                                    Text(model.isBuyingTokens ? "Purchase amount" : "Withdrawal amount")
                                        .font(.system(.subheadline, design: .rounded, weight: .semibold))
                                    Spacer()
                                    Text("$\(Int(model.exchangeAmount.rounded()))")
                                        .font(.system(.headline, design: .rounded, weight: .bold))
                                        .foregroundStyle(Palette.blue)
                                }

                                Slider(value: $model.exchangeAmount, in: 5...150, step: 1)
                                    .tint(Palette.blue)

                                RetroButton(title: model.isBuyingTokens ? "Preview Stripe purchase" : "Preview Venmo cash out", tint: Palette.blue) {
                                    let delta = Int(model.exchangeAmount.rounded())
                                    if model.isBuyingTokens {
                                        model.walletBalance += delta
                                    } else {
                                        model.walletBalance = max(0, model.walletBalance - delta)
                                    }
                                }

                                Text(model.isBuyingTokens ? "Demo behavior: this simulates a Stripe purchase and credits tokens immediately." : "Demo behavior: this simulates a seller cash-out after payout review.")
                                    .font(.system(.footnote, design: .rounded, weight: .medium))
                                    .foregroundStyle(Palette.ink.opacity(0.68))
                            }
                        }

                        RetroCard {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Wallet activity")
                                    .font(.system(.headline, design: .rounded, weight: .bold))
                                    .foregroundStyle(Palette.ink)
                                ForEach(model.walletEntries) { entry in
                                    HStack(alignment: .top, spacing: 12) {
                                        Circle()
                                            .fill(entry.kind.color)
                                            .frame(width: 12, height: 12)
                                            .padding(.top, 6)
                                        VStack(alignment: .leading, spacing: 2) {
                                            Text(entry.title)
                                                .font(.system(.subheadline, design: .rounded, weight: .black))
                                                .foregroundStyle(Palette.ink)
                                            Text(entry.subtitle)
                                                .font(.system(.footnote, design: .rounded))
                                                .foregroundStyle(Palette.ink.opacity(0.7))
                                        }
                                        Spacer()
                                        Text("\(entry.kind.prefix)\(entry.amount)")
                                            .font(.system(.subheadline, design: .rounded, weight: .black))
                                            .foregroundStyle(entry.kind.color)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 18)
                    .padding(.top, 12)
                    .padding(.bottom, 18)
                }
            }
            .navigationTitle("Wallet")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProviderConnectionRow: View {
    let provider: WalletProvider
    let title: String
    let detail: String
    let status: String
    let isActive: Bool
    let action: () -> Void

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            ZStack {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(isActive ? Palette.blue.opacity(0.12) : Palette.cream)
                    .frame(width: 48, height: 48)
                Image(systemName: provider.symbol)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(isActive ? Palette.blue : Palette.ink)
            }

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(title)
                        .font(.system(.subheadline, design: .rounded, weight: .bold))
                        .foregroundStyle(Palette.ink)
                    Spacer()
                    Text(status.uppercased())
                        .font(.system(.caption2, design: .rounded, weight: .bold))
                        .foregroundStyle(isActive ? Palette.blue : Palette.ink.opacity(0.55))
                }

                Text(detail)
                    .font(.system(.footnote, design: .rounded, weight: .medium))
                    .foregroundStyle(Palette.ink.opacity(0.68))
            }

            Button(isActive ? "Manage" : "Connect", action: action)
                .font(.system(.caption, design: .rounded, weight: .bold))
                .foregroundStyle(isActive ? Palette.blue : Palette.surface)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(
                    Capsule(style: .continuous)
                        .fill(isActive ? Palette.sky : Palette.blue)
                )
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Palette.surface)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Palette.line, lineWidth: 1)
        )
    }
}

struct ListingRow: View {
    let listing: Listing

    var body: some View {
        RetroCard {
            HStack(alignment: .top, spacing: 14) {
                SwagArtView(style: listing.art, brand: listing.company)
                    .frame(width: 122, height: 140)

                VStack(alignment: .leading, spacing: 10) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(listing.company.wordmark)
                                .font(.system(.caption, design: .rounded, weight: .black))
                                .foregroundStyle(Palette.blue)
                            Text(listing.title)
                                .font(.system(.headline, design: .rounded, weight: .black))
                                .foregroundStyle(Palette.ink)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        Spacer()
                        TokenBadge(tokens: listing.tokenPrice)
                    }

                    HStack(spacing: 8) {
                        Pill(text: listing.category.rawValue)
                        Pill(text: listing.condition.rawValue)
                        Pill(text: listing.intent.rawValue)
                    }

                    if let circleName = listing.circleName {
                        VerifiedPill(text: circleName)
                    }

                    Text(listing.description)
                        .font(.system(.footnote, design: .rounded, weight: .medium))
                        .foregroundStyle(Palette.ink.opacity(0.76))
                        .lineLimit(3)

                    HStack {
                        Text("\(listing.verifiedPhotos) verified photos")
                        Spacer()
                        Text(listing.demand)
                    }
                    .font(.system(.caption, design: .rounded, weight: .bold))
                    .foregroundStyle(Palette.ink.opacity(0.62))
                }
            }
        }
    }
}

struct ProductTile: View {
    let listing: Listing

    var body: some View {
        RetroCard(fill: LinearGradient(colors: [Palette.paper, Palette.cream, listing.company.colors.last?.opacity(0.22) ?? Palette.sky.opacity(0.25)], startPoint: .topLeading, endPoint: .bottomTrailing)) {
            VStack(alignment: .leading, spacing: 10) {
                ZStack(alignment: .topLeading) {
                    SwagArtView(style: listing.art, brand: listing.company)
                        .frame(height: 148)

                    if listing.isRetro {
                        Pill(text: "Retro", fill: Palette.orange)
                    } else if listing.circleName != nil {
                        Pill(text: "Verified", fill: Palette.sky)
                    }
                }

                Text(listing.company.wordmark)
                    .font(.system(.caption2, design: .rounded, weight: .black))
                    .foregroundStyle(Palette.blue)

                Text(listing.title)
                    .font(.system(.subheadline, design: .rounded, weight: .black))
                    .foregroundStyle(Palette.ink)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)

                HStack(alignment: .lastTextBaseline) {
                    Text("\(listing.tokenPrice)")
                        .font(.system(size: 24, weight: .black, design: .rounded))
                        .foregroundStyle(Palette.ink)
                    Text("tokens")
                        .font(.system(.caption, design: .rounded, weight: .black))
                        .foregroundStyle(Palette.blue)
                    Spacer()
                    Text(listing.size)
                        .font(.system(.caption, design: .rounded, weight: .bold))
                        .foregroundStyle(Palette.ink.opacity(0.7))
                }

                HStack(spacing: 8) {
                    Pill(text: listing.category.rawValue)
                    Pill(text: listing.condition.rawValue, fill: Palette.cream)
                }

                Text(listing.description)
                    .font(.system(.caption, design: .rounded, weight: .medium))
                    .foregroundStyle(Palette.ink.opacity(0.72))
                    .lineLimit(3)

                HStack {
                    Text(listing.demand)
                        .font(.system(.caption, design: .rounded, weight: .black))
                        .foregroundStyle(Palette.ink.opacity(0.65))
                    Spacer()
                    TokenBadge(tokens: listing.tokenPrice, label: "Buy")
                }
            }
        }
    }
}

struct FeaturedListingRow: View {
    let listing: Listing

    var body: some View {
        RetroCard(fill: LinearGradient(colors: [Palette.paper, Palette.sky.opacity(0.8), Palette.lemon.opacity(0.9)], startPoint: .topLeading, endPoint: .bottomTrailing)) {
            VStack(alignment: .leading, spacing: 12) {
                SwagArtView(style: listing.art, brand: listing.company)
                    .frame(height: 180)

                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(listing.company.wordmark)
                            .font(.system(.caption, design: .rounded, weight: .black))
                            .foregroundStyle(Palette.blue)
                        Text(listing.title)
                            .font(.system(.title3, design: .rounded, weight: .black))
                            .foregroundStyle(Palette.ink)
                    }
                    Spacer()
                    if listing.isRetro {
                        Pill(text: "RETRO", fill: Palette.orange)
                    }
                }

                HStack(spacing: 10) {
                    TokenBadge(tokens: listing.tokenPrice)
                    if let circleName = listing.circleName {
                        VerifiedPill(text: circleName)
                    }
                }
            }
        }
    }
}

struct CommerceStatCard: View {
    let value: String
    let label: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(value)
                .font(.system(.title3, design: .rounded, weight: .black))
                .foregroundStyle(Palette.ink)
            Text(label.uppercased())
                .font(.system(.caption2, design: .rounded, weight: .black))
                .foregroundStyle(Palette.blue)
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(alignment: .bottomTrailing) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Palette.shadow)
                .offset(x: 3, y: 3)
        }
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Palette.paper.opacity(0.95))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Palette.ink, lineWidth: 2)
        )
    }
}

struct AuctionRow: View {
    let lot: AuctionLot

    var body: some View {
        RetroCard(fill: LinearGradient(colors: [Palette.paper, Palette.pink.opacity(0.76), Palette.sky.opacity(0.76)], startPoint: .topLeading, endPoint: .bottomTrailing)) {
            HStack(alignment: .top, spacing: 14) {
                SwagArtView(style: lot.art, brand: lot.company)
                    .frame(width: 118, height: 140)

                VStack(alignment: .leading, spacing: 10) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(lot.company.wordmark)
                                .font(.system(.caption, design: .rounded, weight: .black))
                                .foregroundStyle(Palette.blue)
                            Text(lot.title)
                                .font(.system(.headline, design: .rounded, weight: .black))
                                .foregroundStyle(Palette.ink)
                        }
                        Spacer()
                        Pill(text: lot.endsIn, fill: Palette.orange)
                    }

                    Text(lot.story)
                        .font(.system(.footnote, design: .rounded, weight: .medium))
                        .foregroundStyle(Palette.ink.opacity(0.76))

                    HStack(spacing: 8) {
                        TokenBadge(tokens: lot.currentBid, label: "Bid")
                        TokenBadge(tokens: lot.buyNow, label: "Buy now")
                    }

                    Text("\(lot.watchers) watchers")
                        .font(.system(.caption, design: .rounded, weight: .bold))
                        .foregroundStyle(Palette.ink.opacity(0.62))
                }
            }
        }
    }
}

struct CircleRow: View {
    let circle: CompanyCircle

    var body: some View {
        RetroCard(fill: LinearGradient(colors: [Palette.paper, circle.brand.colors.first?.opacity(0.25) ?? Palette.sky, Palette.cream], startPoint: .topLeading, endPoint: .bottomTrailing)) {
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(circle.brand.wordmark)
                            .font(.system(.caption, design: .rounded, weight: .black))
                            .foregroundStyle(Palette.blue)
                        Text(circle.name)
                            .font(.system(.headline, design: .rounded, weight: .black))
                            .foregroundStyle(Palette.ink)
                    }
                    Spacer()
                    Pill(text: circle.isMember ? "VERIFIED" : "LOCKED", fill: circle.isMember ? Palette.mint : Palette.orange)
                }

                HStack(spacing: 10) {
                    MiniFact(text: "\(circle.memberCount) members")
                    MiniFact(text: "\(circle.liveListings) live listings")
                }

                Text(circle.requirement)
                    .font(.system(.subheadline, design: .rounded, weight: .semibold))
                    .foregroundStyle(Palette.ink)

                Text(circle.accessNote)
                    .font(.system(.footnote, design: .rounded, weight: .medium))
                    .foregroundStyle(Palette.ink.opacity(0.72))
            }
        }
    }
}

struct ListingDetailSheet: View {
    let listing: Listing

    var body: some View {
        NavigationStack {
            ZStack {
                Palette.pageBackground.ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 18) {
                        RetroCard(fill: Palette.heroBackground) {
                            VStack(alignment: .leading, spacing: 16) {
                                SwagArtView(style: listing.art, brand: listing.company)
                                    .frame(height: 220)

                                HStack(alignment: .top) {
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text(listing.company.wordmark)
                                            .font(.system(.caption, design: .rounded, weight: .black))
                                            .foregroundStyle(Palette.blue)
                                        Text(listing.title)
                                            .font(.system(.title2, design: .rounded, weight: .black))
                                            .foregroundStyle(Palette.ink)
                                    }
                                    Spacer()
                                    TokenBadge(tokens: listing.tokenPrice)
                                }

                                HStack(spacing: 8) {
                                    Pill(text: listing.category.rawValue)
                                    Pill(text: listing.condition.rawValue)
                                    Pill(text: listing.size)
                                }

                                if let circleName = listing.circleName {
                                    VerifiedPill(text: circleName)
                                }
                            }
                        }

                        RetroCard {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Why this piece matters")
                                    .font(.system(.headline, design: .rounded, weight: .black))
                                    .foregroundStyle(Palette.ink)
                                Text(listing.description)
                                    .font(.system(.body, design: .rounded, weight: .medium))
                                    .foregroundStyle(Palette.ink.opacity(0.82))
                                BulletLine(title: "Seller", detail: "\(listing.sellerName), \(listing.sellerRole), \(listing.location)")
                                BulletLine(title: "Proof", detail: "\(listing.verifiedPhotos) photos attached")
                                BulletLine(title: "Year", detail: listing.year)
                            }
                        }

                        HStack(spacing: 12) {
                            RetroButton(title: "Reserve with tokens", tint: Palette.blue) { }
                            RetroButton(title: "Propose swap", tint: Palette.paper, textColor: Palette.blue) { }
                        }
                    }
                    .padding(18)
                }
            }
            .navigationTitle("Listing")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AuctionDetailSheet: View {
    let lot: AuctionLot

    var body: some View {
        NavigationStack {
            ZStack {
                Palette.pageBackground.ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 18) {
                        AuctionRow(lot: lot)
                        RetroCard {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Vault rules")
                                    .font(.system(.headline, design: .rounded, weight: .black))
                                    .foregroundStyle(Palette.ink)
                                BulletLine(title: "Why separate", detail: "Vault items are exclusive, rare, or hard to price, so they do not mix with fixed-price browse listings.")
                                BulletLine(title: "How it works", detail: "Buyers can place bids in tokens or skip the auction with a buy-now price when the seller enables it.")
                                BulletLine(title: "Trust", detail: "High-demand drops should require manual review before any real launch.")
                            }
                        }

                        HStack(spacing: 12) {
                            RetroButton(title: "Place bid", tint: Palette.blue) { }
                            RetroButton(title: "Buy now", tint: Palette.paper, textColor: Palette.blue) { }
                        }
                    }
                    .padding(18)
                }
            }
            .navigationTitle("Vault detail")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SwagArtView: View {
    let style: ArtStyle
    let brand: TechBrand

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(Palette.shadow)
                .offset(x: 4, y: 4)

            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(LinearGradient(colors: [Palette.paper, brand.colors.first?.opacity(0.35) ?? Palette.sky, brand.colors.last?.opacity(0.24) ?? Palette.peach], startPoint: .topLeading, endPoint: .bottomTrailing))
                .overlay(
                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .stroke(Palette.ink, lineWidth: 2)
                )

            switch style {
            case .openAIStickerSheet:
                stickerSheetView(title: "RESEARCH", brand: brand, subtitle: "Sticker sheet")
            case .googleNotebook:
                notebookView(title: "Campus\nNotebook", brand: brand)
            case .uberHoodie:
                garmentView(symbol: "square.stack.3d.up.fill", title: "UBER\nOPS", subtitle: "late shift hoodie", brand: brand)
            case .boxJacket:
                garmentView(symbol: "shield.fill", title: "BOX\nBLUE ROOM", subtitle: "summit jacket", brand: brand)
            case .netflixJurassicTee:
                jurassicView()
            case .githubStickerPack:
                stickerSheetView(title: "OCTOCAT", brand: brand, subtitle: "issue pack")
            case .stripeConferenceTee:
                garmentView(symbol: "tshirt.fill", title: "DEV\nECONOMY", subtitle: "conference tee", brand: brand)
            case .googleBottle:
                bottleView(title: "Campus\nBottle", brand: brand)
            case .openAINotebook:
                notebookView(title: "Alignment\nNotes", brand: brand)
            case .boxStickerSheet:
                stickerSheetView(title: "BOX\nARCHIVE", brand: brand, subtitle: "legacy stickers")
            case .openAIResearchJacket:
                jacketView(title: "RESEARCH\nFIELD", subtitle: "issue jacket", brand: brand, accent: Palette.mint)
            case .githubNotebook:
                notebookView(title: "Ship\nLog", brand: brand, detail: "grid pages / commit tabs")
            case .stripeBottle:
                bottleView(title: "Launch\nBottle", brand: brand, accentBands: true)
            case .googleStickerSheet:
                stickerSheetView(title: "I/O\nICONS", brand: brand, subtitle: "campus sheet")
            case .openAIBundleBox:
                bundleView(title: "STARTER\nBUNDLE", brand: brand)
            }
        }
    }

    private func stickerSheetView(title: String, brand: TechBrand, subtitle: String) -> some View {
        VStack(spacing: 10) {
            HStack(spacing: 8) {
                ForEach(0..<3, id: \.self) { index in
                    Circle()
                        .fill(brand.colors[index % brand.colors.count])
                        .frame(width: 24, height: 24)
                        .overlay(Circle().stroke(Palette.ink, lineWidth: 2))
                }
            }
            Text(title)
                .font(.system(size: 18, weight: .black, design: .rounded))
                .multilineTextAlignment(.center)
                .foregroundStyle(Palette.ink)
            Text(subtitle.uppercased())
                .font(.system(.caption2, design: .rounded, weight: .black))
                .foregroundStyle(Palette.blue)
        }
        .padding(12)
    }

    private func notebookView(title: String, brand: TechBrand, detail: String = "graph paper / tabs") -> some View {
        VStack(spacing: 10) {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Palette.cream)
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Palette.ink, lineWidth: 3)
                )
                .overlay(
                    VStack(spacing: 8) {
                        Text(brand.wordmark)
                            .font(.system(.caption, design: .rounded, weight: .black))
                            .foregroundStyle(Palette.blue)
                        Text(title)
                            .font(.system(size: 18, weight: .black, design: .rounded))
                            .foregroundStyle(Palette.ink)
                            .multilineTextAlignment(.center)
                    }
                    .padding(10)
                )
                .frame(width: 84, height: 110)
            Text(detail)
                .font(.system(.caption2, design: .rounded, weight: .black))
                .foregroundStyle(Palette.ink.opacity(0.68))
        }
    }

    private func garmentView(symbol: String, title: String, subtitle: String, brand: TechBrand) -> some View {
        VStack(spacing: 10) {
            Image(systemName: symbol)
                .font(.system(size: 64, weight: .bold))
                .foregroundStyle(brand.colors.first ?? Palette.blue)
                .shadow(color: Palette.ink.opacity(0.12), radius: 0, x: 0, y: 4)
            Text(title)
                .font(.system(size: 18, weight: .black, design: .rounded))
                .foregroundStyle(Palette.ink)
                .multilineTextAlignment(.center)
            Text(subtitle.uppercased())
                .font(.system(.caption2, design: .rounded, weight: .black))
                .foregroundStyle(Palette.blue)
        }
        .padding(12)
    }

    private func bottleView(title: String, brand: TechBrand) -> some View {
        bottleView(title: title, brand: brand, accentBands: false)
    }

    private func bottleView(title: String, brand: TechBrand, accentBands: Bool) -> some View {
        VStack(spacing: 10) {
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(brand.colors.first ?? Palette.blue)
                .frame(width: 48, height: 94)
                .overlay(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .stroke(Palette.ink, lineWidth: 3)
                )
                .overlay(
                    ZStack {
                        if accentBands {
                            VStack(spacing: 10) {
                                Capsule()
                                    .fill(brand.colors.last ?? Palette.sky)
                                    .frame(width: 28, height: 10)
                                Capsule()
                                    .fill(Palette.paper.opacity(0.9))
                                    .frame(width: 22, height: 8)
                                Capsule()
                                    .fill(brand.colors.last ?? Palette.sky)
                                    .frame(width: 28, height: 10)
                            }
                        }
                        Rectangle()
                            .fill(Palette.paper)
                            .frame(width: 26, height: 16)
                            .offset(y: -44)
                    }
                )
            Text(title)
                .font(.system(size: 18, weight: .black, design: .rounded))
                .foregroundStyle(Palette.ink)
                .multilineTextAlignment(.center)
        }
        .padding(12)
    }

    private func jacketView(title: String, subtitle: String, brand: TechBrand, accent: Color) -> some View {
        VStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .fill(brand.colors.first ?? Palette.blue)
                    .frame(width: 94, height: 102)
                    .overlay(
                        RoundedRectangle(cornerRadius: 22, style: .continuous)
                            .stroke(Palette.ink, lineWidth: 3)
                    )

                VStack(spacing: 8) {
                    Capsule()
                        .fill(accent)
                        .frame(width: 34, height: 10)
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(Palette.paper.opacity(0.88))
                        .frame(width: 18, height: 42)
                    HStack(spacing: 16) {
                        Circle()
                            .fill(accent)
                            .frame(width: 12, height: 12)
                        Circle()
                            .fill(accent)
                            .frame(width: 12, height: 12)
                    }
                }
            }

            Text(title)
                .font(.system(size: 18, weight: .black, design: .rounded))
                .foregroundStyle(Palette.ink)
                .multilineTextAlignment(.center)
            Text(subtitle.uppercased())
                .font(.system(.caption2, design: .rounded, weight: .black))
                .foregroundStyle(Palette.blue)
        }
        .padding(12)
    }

    private func bundleView(title: String, brand: TechBrand) -> some View {
        VStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Palette.lemon)
                    .frame(width: 92, height: 74)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(Palette.ink, lineWidth: 3)
                    )

                HStack(alignment: .bottom, spacing: 8) {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Palette.cream)
                        .frame(width: 18, height: 42)
                        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Palette.ink, lineWidth: 2))
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(brand.colors.first ?? Palette.blue)
                        .frame(width: 24, height: 52)
                        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Palette.ink, lineWidth: 2))
                    Circle()
                        .fill(brand.colors.last ?? Palette.sky)
                        .frame(width: 20, height: 20)
                        .overlay(Circle().stroke(Palette.ink, lineWidth: 2))
                }
            }

            Text(title)
                .font(.system(size: 18, weight: .black, design: .rounded))
                .foregroundStyle(Palette.ink)
                .multilineTextAlignment(.center)
            Text(brand.wordmark)
                .font(.system(.caption2, design: .rounded, weight: .black))
                .foregroundStyle(Palette.blue)
        }
        .padding(12)
    }

    private func jurassicView() -> some View {
        VStack(spacing: 10) {
            ZStack {
                Circle()
                    .fill(Palette.orange)
                    .frame(width: 84, height: 84)
                    .overlay(Circle().stroke(Palette.ink, lineWidth: 3))
                Image(systemName: "tshirt.fill")
                    .font(.system(size: 44, weight: .bold))
                    .foregroundStyle(Palette.ink)
                Text("2012")
                    .font(.system(.caption2, design: .rounded, weight: .black))
                    .foregroundStyle(Palette.paper)
                    .offset(y: 26)
            }

            Text("NETFLIX\nJURASSIC STACK")
                .font(.system(size: 18, weight: .black, design: .rounded))
                .multilineTextAlignment(.center)
                .foregroundStyle(Palette.ink)
            Text("hackathon tee")
                .font(.system(.caption2, design: .rounded, weight: .black))
                .foregroundStyle(Palette.blue)
        }
        .padding(12)
    }
}

struct RetroCard<Content: View>: View {
    var fill: LinearGradient = LinearGradient(colors: [Palette.surface, Palette.cream], startPoint: .topLeading, endPoint: .bottomTrailing)
    @ViewBuilder let content: Content

    var body: some View {
        content
            .padding(18)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 26, style: .continuous)
                    .fill(fill)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 26, style: .continuous)
                    .stroke(Palette.line, lineWidth: 1)
            )
            .shadow(color: Palette.shadow, radius: 18, x: 0, y: 10)
    }
}

struct RetroButton: View {
    let title: String
    let tint: Color
    var textColor: Color = Palette.paper
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(.subheadline, design: .rounded, weight: .semibold))
                .foregroundStyle(textColor)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(tint)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Palette.line, lineWidth: 1)
                )
                .shadow(color: Palette.shadow, radius: 12, x: 0, y: 6)
        }
        .buttonStyle(.plain)
    }
}

struct TokenBadge: View {
    let tokens: Int
    var label: String = "Tokens"

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(label.uppercased())
                .font(.system(.caption2, design: .rounded, weight: .black))
                .foregroundStyle(Palette.blue)
            Text("\(tokens)")
                .font(.system(.headline, design: .rounded, weight: .black))
                .foregroundStyle(Palette.ink)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Palette.blue.opacity(0.08))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(Palette.blue.opacity(0.16), lineWidth: 1)
        )
    }
}

struct Pill: View {
    let text: String
    var fill: Color = Palette.paper

    var body: some View {
        Text(text)
            .font(.system(.caption, design: .rounded, weight: .black))
            .foregroundStyle(Palette.ink)
            .padding(.horizontal, 10)
            .padding(.vertical, 7)
            .background(
                Capsule(style: .continuous)
                    .fill(fill)
            )
            .overlay(
                Capsule(style: .continuous)
                    .stroke(Palette.line, lineWidth: 1)
            )
    }
}

struct VerifiedPill: View {
    let text: String

    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: "checkmark.shield.fill")
            Text(text)
        }
        .font(.system(.caption, design: .rounded, weight: .black))
        .foregroundStyle(Palette.blue)
        .padding(.horizontal, 10)
        .padding(.vertical, 7)
        .background(
            Capsule(style: .continuous)
                .fill(Palette.sky.opacity(0.85))
        )
        .overlay(
            Capsule(style: .continuous)
                .stroke(Palette.ink, lineWidth: 2)
        )
    }
}

struct MiniFact: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.system(.caption, design: .rounded, weight: .black))
            .foregroundStyle(Palette.ink)
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Palette.cream)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(Palette.line, lineWidth: 1)
            )
    }
}

struct FilterFieldLabel: View {
    let title: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title.uppercased())
                .font(.system(.caption2, design: .rounded, weight: .black))
                .foregroundStyle(Palette.blue)
            HStack {
                Text(value)
                    .font(.system(.subheadline, design: .rounded, weight: .black))
                    .foregroundStyle(Palette.ink)
                    .lineLimit(1)
                Spacer()
                Image(systemName: "chevron.down")
                    .font(.system(size: 12, weight: .black))
                    .foregroundStyle(Palette.ink)
            }
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Palette.cream)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(Palette.line, lineWidth: 1)
        )
    }
}

struct TextFieldField: View {
    let title: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title.uppercased())
                .font(.system(.caption2, design: .rounded, weight: .black))
                .foregroundStyle(Palette.blue)
            TextField(title, text: $text)
                .font(.system(.body, design: .rounded, weight: .semibold))
                .foregroundStyle(Palette.ink)
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(Palette.cream)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .stroke(Palette.line, lineWidth: 1)
                )
        }
    }
}

struct StepperField: View {
    let title: String
    @Binding var value: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title.uppercased())
                .font(.system(.caption2, design: .rounded, weight: .black))
                .foregroundStyle(Palette.blue)
            Stepper(value: $value, in: 1...200) {
                Text("\(value) tokens")
                    .font(.system(.body, design: .rounded, weight: .black))
                    .foregroundStyle(Palette.ink)
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(Palette.cream)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .stroke(Palette.line, lineWidth: 1)
            )
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct NotesField: View {
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("NOTES")
                .font(.system(.caption2, design: .rounded, weight: .black))
                .foregroundStyle(Palette.blue)
            TextEditor(text: $text)
                .frame(minHeight: 100)
                .scrollContentBackground(.hidden)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(Palette.cream)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .stroke(Palette.line, lineWidth: 1)
                )
                .foregroundStyle(Palette.ink)
        }
    }
}

struct BottomTabBar: View {
    @Binding var selectedTab: AppTab

    var body: some View {
        HStack(spacing: 8) {
            tabButton(.discover, title: "Browse", systemImage: "storefront.fill")
            tabButton(.vault, title: "Vault", systemImage: "sparkles")
            tabButton(.sell, title: "List", systemImage: "camera.fill")
            tabButton(.circles, title: "Circles", systemImage: "checkmark.shield.fill")
            tabButton(.wallet, title: "Wallet", systemImage: "bitcoinsign.circle.fill")
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .fill(.ultraThinMaterial)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .stroke(Palette.line, lineWidth: 1)
        )
        .shadow(color: Palette.shadow, radius: 18, x: 0, y: 8)
    }

    private func tabButton(_ tab: AppTab, title: String, systemImage: String) -> some View {
        Button {
            selectedTab = tab
        } label: {
            VStack(spacing: 4) {
                Image(systemName: systemImage)
                    .font(.system(size: 18, weight: .bold))
                Text(title)
                    .font(.system(.caption2, design: .rounded, weight: .bold))
            }
            .foregroundStyle(selectedTab == tab ? Palette.blue : Palette.ink)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(selectedTab == tab ? Palette.blue.opacity(0.1) : Color.clear)
            )
        }
        .buttonStyle(.plain)
    }
}

struct BulletLine: View {
    let title: String
    let detail: String

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Circle()
                .fill(Palette.blue)
                .frame(width: 10, height: 10)
                .padding(.top, 5)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(.subheadline, design: .rounded, weight: .black))
                    .foregroundStyle(Palette.ink)
                Text(detail)
                    .font(.system(.footnote, design: .rounded, weight: .medium))
                    .foregroundStyle(Palette.ink.opacity(0.76))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
