//
//  AddItemView.swift
//  LootApp
//
//  Created by Lou RASSAT on 1/19/24.
//

import SwiftUI

enum Rarity:String, CaseIterable {
    case common = "Common"
    case uncommon = "Uncommon"
    case rare = "Rare"
    case epic = "Epic"
    case legendary = "Legendary"
    case unique = "Unique"
    
    var color: Color {
        switch self {
        case .common:
            return .gray
        case .uncommon:
            return .green
        case .rare:
            return .blue
        case .epic:
            return .purple
        case .legendary:
            return .orange
        case .unique:
            return .red
        }
    }
}

struct AddItemView: View {
    @State private var nameValue = ""
    @State private var rarityValue: Rarity = Rarity.common
    @State private var gameValue: Game = Game.emptyGame
    @State private var typeValue: ItemType = ItemType.unknown
    @State private var quantityGameValue = 1
    @State private var itemAttackBool = false
    @State private var attackStrengthValue = 1
    let step = 1
    let range = 1...50
    @EnvironmentObject var inventaire: Inventory
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Nom de l'objet", text: $nameValue)
                    Picker("Rarete", selection: $rarityValue) {
                        ForEach(Rarity.allCases, id: \.self) { rarity in
                            Text(String(describing: rarity).capitalized)
                        }
                    }
                }
                Section {
                    Picker("Jeu", selection: $gameValue) {
                        Text("Non spécifié").tag(Game.emptyGame)
                        ForEach(availableGames, id: \.self) { game in
                            Text(String(describing: game.name).capitalized)
                        }
                    }
                    Stepper(
                        value: $quantityGameValue,
                        in: range,
                        step: step
                    ) {
                        Text("Quantité: \(quantityGameValue)")
                    }
                }
                Section {
                    HStack {
                        Text("Type")
                        Spacer()
                        Text("\($typeValue.wrappedValue.rawValue)")
                    }
                    Picker("Type", selection: $typeValue) {
                        ForEach(ItemType.allCases, id: \.self) { itemType in
                            Text(itemType.rawValue)
                        }
                    }
                    .pickerStyle(PalettePickerStyle())
                }
                Section {
                    Toggle(isOn: $itemAttackBool.animation()) {
                        Text("Item d'attaque ?")
                    }
                    if itemAttackBool {
                        Stepper(
                            value: $attackStrengthValue,
                            in: range,
                            step: step
                        ) {
                            Text("Force d'attaque: \(attackStrengthValue)")
                        }
                    }
                }
                Button(action: {
                    inventaire.addItem(item: LootItem(id: UUID(), quantity: quantityGameValue, name: nameValue, type: typeValue, rarity: rarityValue, attackStrength: attackStrengthValue, game: gameValue))
                    dismiss()
                }, label: {
                    Text("Ajouter l'objet")
                })
            }
            .navigationBarTitle("Ajouter un Loot")
        }
    }
}

#Preview {
    AddItemView()
}
