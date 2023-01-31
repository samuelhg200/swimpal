//
//  MainControllerView.swift
//  swimpal
//
//  Created by Samuel Hervás Gómez on 1/23/23.
//

import SwiftUI

struct MainControllerView: View {
    @State private var selection = 1
    
    let defaults = UserDefaults.standard
    @AppStorage("duePlan") var duePlan: Bool = true
    
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(red: 0.188, green: 0.424, blue: 0.878, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 0.765, green: 0.831, blue: 0.965, alpha: 0.6)
    }

    
    var body: some View {

        TabView(selection: $selection) {
            
            TimesView()
                .tabItem {
                    Image(systemName: "stopwatch")
                    Text("Times")
                }.tag(0)
           
            if duePlan {
                CreatePlanView()
                    .tabItem {
                         Image(systemName: "bolt")
                        Text("Training")
                     }.tag(1)
            } else {
                TrainingView()
                   .tabItem {
                        Image(systemName: "bolt")
                       Text("Training")
                    }.tag(1)
            }
            StatisticsView()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Stats")
                }.tag(2)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .accentColor(.white)
        .onAppear() {
            UITabBar.appearance().barTintColor = .blue
        }
    }
}

struct MainControllerView_Previews: PreviewProvider {
    static var previews: some View {
        MainControllerView()
    }
}
