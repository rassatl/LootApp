//
//  LootAppApp.swift
//  LootApp
//
//  Created by Lou RASSAT on 1/19/24.
//

import SwiftUI

struct LootItemStruct: Hashable {
    var title: String
    var img: String
    var subtitle: String
}

let firstItem = LootItemStruct(
    title: "Gérer ses loots",
    img: "gym.bag.fill",
    subtitle: "Ajouter facilement vos trouvailles et vos achats à votre collection personnelle."
)

let secondItem = LootItemStruct(
    title: "Votre whishlist",
    img: "wand.and.stars.inverse",
    subtitle: "Créez une liste de souhaits pour garder un travce des articles que vous voulez acquérir."
)
let thirdItem = LootItemStruct(
    title: "En un coup d'oeuil",
    img: "iphone.case",
    subtitle: "Accédez rapidement à vos fonctionnalités clés depuis l'écran d'accueil de votre appareil"
)

let lootItems: [LootItemStruct] = [firstItem, secondItem, thirdItem]

@main
struct LootAppApp: App {
    @AppStorage("isOnboardingDone") var isOnboardingDone: Bool = false
    var body: some Scene {
        WindowGroup {
            if isOnboardingDone {
                ContentView()
            } else {
                OnboardingView()
            }
        }
    }
}

struct OnboardingView: View {
    @State var step: Int = 0
    var body: some View {
        TabView(selection: $step,
                content:  {
            OnboardingPageView(title: firstItem.title, img: firstItem.img, subtitle: firstItem.subtitle, step: $step, nextStep: 1).tabItem {}.tag(0)
            OnboardingPageView(title: secondItem.title, img: secondItem.img, subtitle: secondItem.subtitle, step: $step, nextStep: 2).tabItem {}.tag(1)
            OnboardingPageView(title: thirdItem.title, img: thirdItem.img, subtitle: thirdItem.subtitle, step: $step, nextStep: 3).tabItem {}.tag(2)
        })
        
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}
