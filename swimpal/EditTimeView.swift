//
//  EditTimeView.swift
//  swimpal
//
//  Created by Samuel Hervás Gómez on 1/25/23.
//

import SwiftUI
import Combine


struct EditTimeView: View {
    @EnvironmentObject var manager: DataManager
    @Environment(\.managedObjectContext) private var viewContext
    
    @Environment(\.dismiss) var dismiss

    @ObservedObject var time: SwimTime
    
    var strokes = ["Butterfly", "Frontcrawl", "Breaststroke", "Backstroke"]
    @State private var selectedStroke : String
    
    
    
    var distances = ["25m", "50m", "100m", "200m", "400m", "1500m"]
    @State private var selectedDistance : String
    
    var allMinutes = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"]
    
    @State private var minutes: String
    @State private var seconds: String
    
    private func editItem() {
            
        self.time.distance = selectedDistance
        self.time.stroke = selectedStroke
        self.time.minutes = minutes
        self.time.seconds = seconds
        
        try? viewContext.save()
            
    }
    
    private func deleteItem() {
        viewContext.delete(self.time)
    }
    
    init(time: SwimTime){
        self.time = time
        _selectedStroke = State(initialValue: time.stroke!)
        _selectedDistance = State(initialValue: time.distance!)
        _minutes = State(initialValue: time.minutes!)
        _seconds = State(initialValue: time.seconds!)
    }
    
    
    
    var body: some View {
        VStack{
            Spacer()
                .frame(height: 15)
            HStack{
                Button("Cancel") {
                    dismiss()
                }
                .foregroundColor(.white)
                .font(.custom("Inter-BI", size: 20))
                .frame(maxWidth: .infinity)
                Text("Edit Time").font(.custom("Inter-Bold", size: 26)).foregroundColor(.white).frame(maxWidth: .infinity)
                Button("Update"){
                    editItem()
                    dismiss()
                }
                .foregroundColor(.white)
                .font(.custom("Inter-BI", size: 20))
                .frame(maxWidth: .infinity)
            }
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(Color(red: 0.353, green: 0.529, blue: 0.875))
                    .padding()
                    
                HStack {
                    Picker("", selection: $minutes){
                                    ForEach(allMinutes, id: \.self) {
                                        Text($0)
                                    }
                    }.pickerStyle(WheelPickerStyle()).frame(width: 65).clipped().compositingGroup().accentColor(.orange)
                    Text(":").font(.custom("Inter-BI", size: 20)).foregroundColor(.black).frame(width: 5)
                    Picker("", selection: $seconds){
                                    ForEach(allMinutes, id: \.self) {
                                        Text($0)
                                    }
                                }.pickerStyle(WheelPickerStyle()).frame(width: 65).clipped().compositingGroup()
                }
            }.frame(width: UIScreen.main.bounds.size.width, height: 220)
            
            Spacer()
            
            ZStack{
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(Color(red: 0.145, green: 0.145, blue: 0.145)).padding()
                
                VStack {
                    HStack{
                        Text("Stroke").font(.custom("Inter-Bold", size: 20)).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .leading)
                        // picker
                        Picker("", selection: $selectedStroke) {
                                        ForEach(strokes, id: \.self) {
                                            Text($0)
                                }
                        }.accentColor(.white)
                        Text(">").font(.custom("Inter-BI", size: 12)).foregroundColor(.white)
                    }
                    .frame(maxHeight: .infinity)
                    .padding()
                    Rectangle().fill(Color(red: 0.188, green: 0.424, blue: 0.878))
                        .frame(height: 1)
                        
                    HStack{
                        Text("Distance").font(.custom("Inter-Bold", size: 20)).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .leading)
                        // picker
                        Picker("", selection: $selectedDistance) {
                                        ForEach(distances, id: \.self) {
                                            Text($0)
                                }
                        }.accentColor(.white)
                        Text(">").font(.custom("Inter-BI", size: 12)).foregroundColor(.white)
                    }.frame(maxHeight: .infinity).padding()
                }.padding()
            }.frame(height: 170)
            Spacer()
            Spacer()
            VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(Color(.white)).frame(width: 190, height: 50)
                Text("Update Time").font(.custom("Inter-Bold", size: 26)).foregroundColor(.black)
            }.onTapGesture {
                self.editItem()
                dismiss()
            }.padding()
            ZStack{
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(Color(.white)).frame(width: 190, height: 50)
                Text("Delete Time").font(.custom("Inter-Bold", size: 26)).foregroundColor(.black)
            }.onTapGesture {
                self.deleteItem()
                dismiss()
            }}
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(red: 0.188, green: 0.424, blue: 0.878))
        .onTapGesture{
            self.endTextEditing()
        }.navigationTitle("EditTime").navigationBarHidden(true)
    }
}

struct EditTimeView_Previews: PreviewProvider {
    static var previews: some View {
        let time = SwimTime()
        
        EditTimeView(time: time)
    }
}
