//
//  TutorialFourView.swift
//  swimpal
//
//  Created by Samuel Hervás Gómez on 1/22/23.
//

import SwiftUI

struct WeekToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label.font(.custom("Inter-Bold", size: 20)).foregroundColor(configuration.isOn ? .black : .white).padding(.leading, configuration.isOn ? 80 : 10)
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(configuration.isOn ? Color.black : Color.white)
                    .imageScale(.large)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding([.bottom, .leading], 20)
        
    }
}


struct TutorialFourView: View {
    
    
    @State private var monday = false
    @State private var tuesday = false
    @State private var wednesday = false
    @State private var thursday = false
    @State private var friday = false
    @State private var saturday = false
    @State private var sunday = false
    
    @State private var action: Int? = 0
    
    let defaults = UserDefaults.standard
    
    
    
    private func generateTrainingPlan(){
        
    }
    
    var body: some View {
        VStack{
            Spacer()
                .frame(height: 80)
            Text("What days a week do you train?").multilineTextAlignment(.leading)
                .padding().font(.custom("Inter-Bold", size: 33)).foregroundColor(.white)
            
                
            Toggle("Monday", isOn: $monday).toggleStyle(WeekToggleStyle()).padding(.top, 50)
            Toggle("Tuesday", isOn: $tuesday).toggleStyle(WeekToggleStyle())
            Toggle("Wednesday", isOn: $wednesday).toggleStyle(WeekToggleStyle())
            Toggle("Thursday", isOn: $thursday).toggleStyle(WeekToggleStyle())
            Toggle("Friday", isOn: $friday).toggleStyle(WeekToggleStyle())
            Toggle("Saturday", isOn: $saturday).toggleStyle(WeekToggleStyle())
            Toggle("Sunday", isOn: $sunday).toggleStyle(WeekToggleStyle())
            
            
            
            NavigationLink(destination: MainControllerView(), tag: 1, selection:$action, label: {
            Button("Continue") {
                defaults.set(monday, forKey: "mon")
                defaults.set(tuesday, forKey: "tue")
                defaults.set(wednesday, forKey: "wed")
                defaults.set(thursday, forKey: "thu")
                defaults.set(friday, forKey: "fri")
                defaults.set(saturday, forKey: "sat")
                defaults.set(sunday, forKey: "sun")
                
                defaults.set(false, forKey: "duePlan")
                
                UserDefaults.standard.set(true, forKey: "trainingPlan")
                
                self.action = 1
                
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
        .navigationTitle("TutorialFour").navigationBarHidden(true)
    }
}



struct TutorialFourView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialFourView()
    }
}
