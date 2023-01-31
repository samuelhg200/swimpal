//
//  TutorialTwoView.swift
//  swimpal
//
//  Created by Samuel Hervás Gómez on 1/22/23.
//

import SwiftUI
import Combine

extension View {
  func endTextEditing() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                    to: nil, from: nil, for: nil)
  }
}

struct TutorialTwoView: View {
    @State private var action: Int? = 0
    
    @State private var meters: String = ""
    @FocusState private var metersFieldIsFocused: Bool
    
    let defaults = UserDefaults.standard
    
    var body: some View {
        VStack{
            Spacer()
                .frame(height: 80)
            Text("How many meters do you usually swim per training session?").multilineTextAlignment(.leading)
                .padding().font(.custom("Inter-Bold", size: 33)).foregroundColor(.white)
            Spacer().frame(height: 60)
            TextField(
                "meters",
                text: $meters
            )
            .focused($metersFieldIsFocused)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 250)
            .multilineTextAlignment(.leading)
            .keyboardType(.numberPad)
            .onReceive(Just(meters)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.meters = filtered
                            }
                        }
            
            Spacer()
            
            NavigationLink(destination: TutorialThreeView(), tag: 1, selection:$action, label: {
            Button("Continue") {
                self.action = 1
                
                defaults.set(meters, forKey: "meters")
            }
            .padding()
            .background(Color.white)
            .clipShape(Capsule())
            .foregroundColor(Color(red: 0.475, green: 0.627, blue: 0.922))
            .font(.custom("Inter-Bold", size: 28))
            
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, 80)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.475, green: 0.627, blue: 0.922)).ignoresSafeArea()
        .navigationTitle("TutorialTwo").navigationBarHidden(true)
        .onTapGesture{
            self.endTextEditing()
        }
    }
}

struct TutorialTwoView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialTwoView()
    }
}
