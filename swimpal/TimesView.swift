//
//  TimesView.swif
//  swimpal
//
//  Created by Samuel Hervás Gómez on 1/22/23.
//

import SwiftUI


struct TimesView: View {
    @EnvironmentObject var manager: DataManager
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var presentSheet = false
    
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "stroke BEGINSWITH %@", "Butterfly")) private var butTimes: FetchedResults<SwimTime>
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "stroke BEGINSWITH %@", "Frontcrawl")) private var froTimes: FetchedResults<SwimTime>
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "stroke BEGINSWITH %@", "Breaststroke")) private var breTimes: FetchedResults<SwimTime>
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "stroke BEGINSWITH %@", "Backstroke")) private var bacTimes: FetchedResults<SwimTime>
    
    
    
    var body: some View {
        NavigationView{
            ScrollView {
                ZStack{
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(Color(red: 0.188, green: 0.424, blue: 0.878)).frame(width: 195, height: 40)
                    HStack{
                        Text("Add new time").font(.custom("Inter-Bold", size: 20)).foregroundColor(.white)
                        Image(systemName: "plus.circle.fill").font(.system(size: 24)).foregroundColor(.white)
                        
                    }
                }.onTapGesture {
                    presentSheet.toggle()
                }
                .sheet(isPresented: $presentSheet) {
                    
                } content: {
                    AddTimeView(stroke: "Frontcrawl")
                }
                .frame(maxWidth: .infinity, alignment: .trailing).padding(.trailing)
                //Times per stroke
                TimesSection(stroke: "Butterfly", swimTimes: butTimes)
                TimesSection(stroke: "Frontcrawl", swimTimes: froTimes)
                TimesSection(stroke: "Backstroke", swimTimes: bacTimes)
                TimesSection(stroke: "Breaststroke", swimTimes: breTimes)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 0.145, green: 0.145, blue: 0.145))
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
    
        }
    }
    }


struct TimesSection: View {
    var stroke: String
    var swimTimes: FetchedResults<SwimTime>
    
    @State var presentSheet = false
    
    
    @State private var action: Int? = 0
    
    @State private var selectedTime: SwimTime? = nil
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color(red: 0.188, green: 0.424, blue: 0.878)).frame(width: .infinity).padding()
            VStack {
                HStack{
                    Text(stroke).font(.custom("Inter-Bold", size: 25)).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "plus.circle.fill").font(.system(size: 24)).foregroundColor(.white).onTapGesture {
                        presentSheet.toggle()
                    }
                    .sheet(isPresented: $presentSheet) {
                        
                    } content: {
                        AddTimeView(stroke: stroke)
                    }
                }.padding().frame(width: .infinity, alignment: .trailing)
                //add TimesRow
                ForEach(swimTimes,id: \.self) { item in
                        NavigationLink (destination: EditTimeView(time: item).environmentObject(item), tag: item, selection: $selectedTime){
                            
                        
                        HStack{
                            
                            Text(item.distance ?? "No Name").font(.custom("Inter-Bold", size: 20)).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .leading)
                            Text(item.minutes! + ":" + item.seconds! + "m").font(.custom("Inter-Bold", size: 20)).foregroundColor(.white)
                            Image(systemName: "pencil").font(.system(size: 24)).foregroundColor(.white)
                                .onTapGesture {
                                    
                                    
                                }.onTapGesture {
                                    self.action = 1
                                }
                            
                        }.padding().onTapGesture{
                            self.selectedTime = item
                        }
                    
                        }
                    }
            }.frame(alignment: .topLeading).padding()
        }
    }
}

struct TimesRow: View {
    var distance: Int
    var time: Int
    

    var body: some View {
        HStack{
            Text("distance").font(.custom("Inter-Bold", size: 20)).foregroundColor(.white)
            Text("time").font(.custom("Inter-Bold", size: 20)).foregroundColor(.white)
            
        }
    }
}

struct TimesView_Previews: PreviewProvider {
    static var previews: some View {
        TimesView()
    }
}
