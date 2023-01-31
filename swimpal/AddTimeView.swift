//
//  AddTimeView.swift
//  swimpal
//
//  Created by Samuel Hervás Gómez on 1/23/23.
//

import SwiftUI
import Combine

extension UIPickerView {   open override var intrinsicContentSize: CGSize {     return CGSize(width: UIView.noIntrinsicMetric, height: super.intrinsicContentSize.height)   } }


struct AddTimeView: View {
    @EnvironmentObject var manager: DataManager
    @Environment(\.managedObjectContext) private var viewContext
    
    @Environment(\.dismiss) var dismiss
    
    var strokes = ["Butterfly", "Frontcrawl", "Breaststroke", "Backstroke"]
    @State private var selectedStroke: String
    
    
    
    var distances = ["25m", "50m", "100m", "200m", "400m", "1500m"]
    @State private var selectedDistance = "25m"
    
    var allMinutes = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"]
    
    @State private var minutes: String = "1"
    @State private var seconds: String = "20"
    
    init(stroke: String) {
        _selectedStroke = State(initialValue: stroke)

    }
    
    private func addItem() {
                    
        let newSwimTime = SwimTime(context: viewContext)
        newSwimTime.stroke = selectedStroke
        newSwimTime.distance = selectedDistance
        newSwimTime.minutes = minutes
        newSwimTime.seconds = seconds
        
        try? viewContext.save()
            
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
                Text("Add Time").font(.custom("Inter-Bold", size: 26)).foregroundColor(.white).frame(maxWidth: .infinity)
                Button("Save"){
                    addItem()
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
            ZStack{
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(Color(.white)).frame(width: 190, height: 50)
                Text("Add Time").font(.custom("Inter-Bold", size: 26)).foregroundColor(.black)
            }.onTapGesture {
                self.addItem()
                dismiss()
            }
            Spacer()
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(red: 0.188, green: 0.424, blue: 0.878)).ignoresSafeArea()
        .onTapGesture{
            self.endTextEditing()
        }
    }
}

struct AddTimeView_Previews: PreviewProvider {
    static var previews: some View {
        AddTimeView(stroke: "Frontcrawl")
    }
}
