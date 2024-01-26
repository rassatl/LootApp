//
//  OnBoardingView.swift
//  LootApp
//
//  Created by Lou RASSAT on 1/24/24.
//

import SwiftUI

struct OnboardingPageView: View {
    var title: String
    var img: String
    var subtitle: String
    @Binding var step: Int
    var nextStep: Int
    
    var body: some View {
        VStack {
            Text("\(title)")
                .font(.system(size: 60, weight: .bold))
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()

            Image(systemName: "\(img)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .font(.system(size: 80))
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
            
            Text("\(subtitle)")
                .font(.system(size: 20, weight: .light))
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .padding()

            Button(action: {
                if nextStep == 3{
                    UserDefaults.standard.set(true, forKey: "isOnboardingDone")
                }else{
                    step = nextStep
                }
            }) {
                Text(nextStep == 3 ? "Commencer" : "Suivant")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

//struct OnboardingPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingPageView(
//            title: "Gérer ses loots",
//            img: "gym.bag.fill",
//            subtitle: "Ajouter facilement vos trouvailles et vos achats à votre collection personnelle", step:
//        )
//    }
//}
