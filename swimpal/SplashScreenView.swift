//
//  SplashScreenView.swift
//  swimpal
//
//  Created by Samuel Hervás Gómez on 1/17/23.
//

import SwiftUI


struct DefaultsKeys {
    static let trainingPlan = false
    static let duePlan = true
    //tut 1
    static let butterfly = false
    static let breaststroke = false
    static let backstroke = false
    static let frontcrawl = false
    //tut 2
    static let meters = 0
    //tut 3
    static let minutes = 0
    //tut 4
    static let mon = false
    static let tue = false
    static let wed = false
    static let thu = false
    static let fri = false
    static let sat = false
    static let sun = false
    //statistics
    static let butterflyVolume = 0
    static let breaststrokeVolume = 0
    static let frontcrawlVolume = 0
    static let backstrokeVolume = 0
    static let highestVolume = 0
    //training
    
    
    
    
}

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    let tutorialDone = UserDefaults.standard.bool(forKey: "trainingPlan")
        
    @State private var action: Int? = 0
    
    var body: some View {
        
        if isActive {
            if tutorialDone {
                MainControllerView()
            } else {
                ContentView()
            }
           
        } else {
            ZStack {
                Image("WavyBackground").resizable().ignoresSafeArea()
            
            VStack{
                VStack {
                    Spacer()
                    Text("SWIMPAL")
                        .padding().font(.custom("Flamenco-Regular", size: 60)).foregroundColor(.white)
                    Spacer()
                    Spacer()
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 1
                        self.opacity = 1.0
                    }
                }
            }.onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                    self.isActive = true
                }
            }
        }
        }
        
        
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
