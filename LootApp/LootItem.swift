//
//  LootItem.swift
//  LootApp
//
//  Created by Lou RASSAT on 1/19/24.
//

import Foundation

struct LootItem: Identifiable {
    var id: UUID
    var quantity: Int = 1
    var name: String
    var type: ItemType
    var rarity: Rarity
    var attackStrength: Int?
    var game: Game
}

// à mettre dans le struct car mieux je crois mais flemme
enum ItemType: String, CaseIterable {
    case magic = "⭐️"
    case fire = "🔥"
    case ice = "❄️"
    case wind = "💨"
    case poison = "☠️"
    case thunder = "⚡️"
    case dagger = "🗡️"
    case shield = "🛡️"
    case bow = "🏹"
    case ring = "💍"
    case unknown = "🎲"
}
