//
//  AddItemView.swift
//  LootApp
//
//  Created by Lou RASSAT on 1/19/24.
//

import SwiftUI

enum Rarity: CaseIterable {
    case common
    case uncommon
    case rare
    case epic
    case legendary
    case unique
}

struct AddItemView: View {
    @State var name = ""
    @State var rarity = Rarity.common
    @EnvironmentObject var inventaire: Inventory

    var body: some View {
        Form {
            Section {
                TextField("Nom de l'objet", text: $name)
                Picker("Rarete", selection: $rarity) {
                    ForEach(Rarity.allCases, id: \.self) { rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }
            Button(action: {
                inventaire.addItem(item: $name.wrappedValue)
            }, label: {
                Text("Ajouter")
            })
        }
    }
}

#Preview {
    AddItemView()
}
