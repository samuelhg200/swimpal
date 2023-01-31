//
//  CreatePlanView.swift
//  swimpal
//
//  Created by Samuel Hervás Gómez on 1/29/23.
//

import SwiftUI

struct CreatePlanView: View {
    @State private var action: Int? = 0
    
    var body: some View {
        VStack {
            Image(systemName: "play.circle.fill").font(.system(size: 100)).foregroundColor(.white).padding()
            Text("Create a training plan").font(.custom("Inter-Bold", size: 32)).foregroundColor(.white)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.145, green: 0.145, blue: 0.145))
            .onTapGesture {
                UserDefaults.standard.set(false, forKey: "trainingPlan")
            }
    }
}

struct CreatePlanView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePlanView()
    }
}
