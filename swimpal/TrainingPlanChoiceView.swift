//
//  TrainingPlanChoiceView.swift
//  swimpal
//
//  Created by Samuel Hervás Gómez on 1/21/23.
//

import SwiftUI



struct TrainingPlanChoiceView: View {
    @State private var action: Int? = 0
    let defaults = UserDefaults.standard

        
    var body: some View {
        ZStack {
            Image("WavyBackground").resizable().ignoresSafeArea()
            VStack {
                Spacer()
                Text("Need a training plan?").multilineTextAlignment(.center)
                    .padding().font(.custom("Flamenco-Regular", size: 50)).foregroundColor(.white)
                Spacer()
                Spacer()
                Group {
                Button("Create Plan") {
                    self.action = 1
                }
                .padding()
                .background(Color(red: 0.1263, green: 0.2842, blue: 0.5895))
                .clipShape(Capsule())
                .foregroundColor(.white)
                .font(.custom("Inter-Bold", size: 28))
                }
                
                Button("I don't need a plan yet"){
                    //self.action = 2
                    defaults.set(true, forKey: "trainingPlan")
                }
                Spacer().frame(height: 30)
                NavigationLink(destination: TutorialOneView(), tag: 1, selection:$action){
                    EmptyView()
                }
                //NavigationLink(destination: MainControllerView(), tag: 2, selection:$action){
                //    EmptyView()
                //}
                
            }
        }.navigationTitle("TrainingPlanChoice").navigationBarHidden(true)
    }
}



struct TrainingPlanChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingPlanChoiceView()
    }
}
