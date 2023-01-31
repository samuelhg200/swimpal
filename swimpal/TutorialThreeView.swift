//
//  TutorialThreeView.swift
//  swimpal
//
//  Created by Samuel Hervás Gómez on 1/22/23.
//

import SwiftUI
import Combine



struct TutorialThreeView: View {
    @State private var action: Int? = 0
    
    @State private var mins: String = ""
    @FocusState private var minsFieldIsFocused: Bool
    
    let defaults = UserDefaults.standard
    
    var body: some View {
        VStack{
            Spacer()
                .frame(height: 80)
            Text("How long in minutes do your sessions usually last?").multilineTextAlignment(.leading)
                .padding().font(.custom("Inter-Bold", size: 33)).foregroundColor(Color(red: 0.188, green: 0.424, blue: 0.878))
            Spacer().frame(height: 60)
            TextField(
                "minutes",
                text: $mins
            )
            .focused($minsFieldIsFocused)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 250)
            .multilineTextAlignment(.leading)
            .keyboardType(.numberPad)
            .onReceive(Just(mins)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.mins = filtered
                            }
                        }
            
            Spacer()
            
            NavigationLink(destination: TutorialFourView(), tag: 1, selection:$action, label: {
            Button("Continue") {
                self.action = 1
                
                defaults.set(mins, forKey: "mins")
            }
            .padding()
            .background(Color.white)
            .clipShape(Capsule())
            .foregroundColor(Color(red: 0.188, green: 0.424, blue: 0.878))
            .font(.custom("Inter-Bold", size: 28))
            
            
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, 80)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.765, green: 0.831, blue: 0.965)).ignoresSafeArea()
        .navigationTitle("TutorialThree").navigationBarHidden(true)
        .onTapGesture{
            self.endTextEditing()
        }
    }
}

struct TutorialThreeView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialThreeView()
    }
}

