//
//  ContentView.swift
//  swimpal
//
//  Created by Samuel Hervás Gómez on 11/28/22.
//

import SwiftUI

struct ContentView: View {
    @State private var action: Int? = UserDefaults.standard.bool(forKey: "trainingPlan") ? 2 : 0
    @State private var selection = 1
    
    @AppStorage("trainingPlan") var trainingPlan: Bool = false
    @AppStorage("duePlan") var duePlan: Bool = true
    
    let defaults = UserDefaults.standard
    
    
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(red: 0.188, green: 0.424, blue: 0.878, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 0.765, green: 0.831, blue: 0.965, alpha: 0.6)
    }
    
    var body: some View {
        if trainingPlan {
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
        if !trainingPlan {
            NavigationView {
                
                ZStack {
                    Image("WavyBackground").resizable().ignoresSafeArea()
                    VStack {
                        Spacer()
                        Text("SWIMPAL")
                            .padding().font(.custom("Flamenco-Regular", size: 60)).foregroundColor(.white)
                        Spacer()
                        Spacer()
                        NavigationLink(destination: TrainingPlanChoiceView(), tag: 1, selection:$action, label: {
                            Button("START") {
                                self.action = 1
                            }
                            .padding()
                            .background(Color(red: 0.1263, green: 0.2842, blue: 0.5895))
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                            .font(.custom("Inter-Bold", size: 28))
                        })
                        
                    }
                }.navigationTitle("Start").navigationBarHidden(true)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
