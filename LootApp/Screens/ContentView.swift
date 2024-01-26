//
//  ContentView.swift
//  LootApp
//
//  Created by Lou RASSAT on 1/19/24.
//

import SwiftUI

enum EnumSortBy: String, CaseIterable {
    case name
    case rarity

    func sortList(_ item1: LootItem, _ item2: LootItem) -> Bool {
        switch self {
        case .name:
            return item1.name < item2.name
        case .rarity:
            return item1.rarity.rawValue < item2.rarity.rawValue
        }
    }
}

enum LooterFeature {
    case loot
    case wishList
    case profile
}

class Inventory: ObservableObject {
    @Published var loot = [
        LootItem(id:UUID(), quantity: 2, name: "Épée", type: .dagger, rarity: .common, attackStrength: 10, game: availableGames[0]),
        LootItem(id:UUID(),name: "Bouclier", type: .shield, rarity: .rare, attackStrength: nil, game: availableGames[1]),
        LootItem(id:UUID(),name: "Arc", type: .bow, rarity: .uncommon, attackStrength: 8, game: availableGames[0]),
        LootItem(id:UUID(),name: "Bague", type: .ring, rarity: .rare, attackStrength: 15, game: availableGames[3]),
        LootItem(id:UUID(),name: "Magie", type: .magic, rarity: .legendary, attackStrength: 15, game: availableGames[3]),
        LootItem(id:UUID(),name: "Boost de vitesse", type: .magic, rarity: .legendary, attackStrength: nil, game: availableGames[3]),
        LootItem(id:UUID(),name: "Potion de poison", type: .poison, rarity: .legendary, attackStrength: 20, game: availableGames[2]),
        LootItem(id:UUID(),name: "Marteau de Thor", type: .thunder, rarity: .unique, attackStrength: 40, game: availableGames[0]),
        LootItem(id:UUID(),name: "Pouvoir du dernier maître de l'air", type: .wind, rarity: .unique, attackStrength: 36, game: availableGames[0]),
        LootItem(id:UUID(),name: "Pouvoir de glace", type: .ice, rarity: .unique, attackStrength: 45, game: availableGames[0]),
        LootItem(id:UUID(),name: "Pouvoir de feu", type: .fire, rarity: .unique, attackStrength: 46, game: availableGames[0]),
    ]

    func addItem(item: LootItem) {
        loot.append(item)
    }
}

struct ContentView: View {
    @State private var selectedFeature: LooterFeature = .loot
    
    var body: some View {
        TabView(selection: $selectedFeature) {
            LootView()
                .tabItem {
                    Label("Loot", systemImage: "gym.bag.fill")
                }
                .tag(LooterFeature.loot)
            WishListView()
                .tabItem {
                    Label("Wishlist", systemImage: "wand.and.stars.inverse")
                }
                .tag(LooterFeature.wishList)
            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.crop.circle.fill")
                }
                .tag(LooterFeature.profile)
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
