//
//  TutorialOneView.swift
//  swimpal
//
//  Created by Samuel Hervás Gómez on 1/21/23.
//

import SwiftUI

struct CheckToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label.font(.custom("Inter-Bold", size: 26)).foregroundColor(configuration.isOn ? .black : .white).padding(.leading, configuration.isOn ? 60 : 10)
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(configuration.isOn ? Color.black : Color.white)
                    .imageScale(.large)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        
    }
}


struct TutorialOneView: View {
    
    @State private var frontcrawl = false
    @State private var breaststroke = false
    @State private var butterfly = false
    @State private var backstroke = false
    
    @State private var action: Int? = 0
    
    let defaults = UserDefaults.standard
    
    var body: some View {
        VStack{
            Spacer()
                .frame(height: 80)
            Text("What stroke(s) do you want to improve upon the most?").multilineTextAlignment(.leading)
                .padding().font(.custom("Inter-Bold", size: 33)).foregroundColor(.white)
            Spacer().frame(height: 60)
            Toggle("Frontcrawl", isOn: $frontcrawl).toggleStyle(CheckToggleStyle())
            Toggle("Breaststroke", isOn: $breaststroke).toggleStyle(CheckToggleStyle())
            Toggle("Butterfly", isOn: $butterfly).toggleStyle(CheckToggleStyle())
            Toggle("Backstroke", isOn: $backstroke).toggleStyle(CheckToggleStyle())
            Spacer()
            NavigationLink(destination: TutorialTwoView(), tag: 1, selection:$action, label: {
            Button("Continue") {
                self.action = 1
                defaults.set(frontcrawl, forKey: "frontcrawl")
                defaults.set(breaststroke, forKey: "breaststroke")
                defaults.set(backstroke, forKey: "backstroke")
                defaults.set(butterfly, forKey: "butterfly")
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
        .frame(maxWidth: .infinity, maxHeight: .infinity) // 1
        .background(Color(red: 0.188, green: 0.424, blue: 0.878)).ignoresSafeArea()
        .navigationTitle("TutorialOne").navigationBarHidden(true)
    }
}

struct TutorialOneView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialOneView()
    }
}
