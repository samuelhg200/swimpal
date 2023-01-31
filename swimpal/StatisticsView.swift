//
//  StatisticsView.swift
//  swimpal
//
//  Created by Samuel Hervás Gómez on 1/22/23.
//  Charts only available for XCODE 14
//

import SwiftUI


struct StatisticsView: View {
    
    @AppStorage("frontcrawlVolume") var frontcrawlVolume: Int = 0
    @AppStorage("breaststrokeVolume") var breaststrokeVolume: Int = 0
    @AppStorage("backstrokeVolume") var backstrokeVolume: Int = 0
    @AppStorage("butterflyVolume") var butterflyVolume: Int = 0
    
    @AppStorage("highestVolume") var highestVolume: Int = 0

    
    private func getFavorite() -> String {
        var favorite = "None"
        var maxVolume = 0
        if frontcrawlVolume > maxVolume {
            maxVolume = frontcrawlVolume
            favorite = "Frontcrawl"
        }
        if butterflyVolume > maxVolume {
            maxVolume = butterflyVolume
            favorite = "Butterfly"
        }
        if breaststrokeVolume > maxVolume {
            maxVolume = breaststrokeVolume
            favorite = "Breaststroke"
        }
        if backstrokeVolume > maxVolume {
            maxVolume = backstrokeVolume
            favorite = "Backstroke"
        }
        
        return favorite
        
    }
    
    var body: some View {
        
        VStack {
            Text("STATISTICS").font(.custom("Inter-Bold", size: 35)).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .leading).padding()
            ZStack{
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(Color(red: 0.188, green: 0.424, blue: 0.878)).frame(width: .infinity, height: 200).padding()
                
                VStack {
                    HStack {
                        Text("Frontcrawl Volume").font(.custom("Inter-Bold", size: 20)).foregroundColor(Color(red: 0.757, green: 0.827, blue: 0.965)).frame(maxWidth: .infinity,alignment: .leading).padding(.leading, 28)
                        Text("\(String(frontcrawlVolume))m").font(.custom("Inter-Bold", size: 20)).foregroundColor(.white).padding(.trailing, 28)
                        
                    }
                            Rectangle().fill(Color(red: 0.145, green: 0.145, blue: 0.145)).frame(height: 2)
                    HStack{
                        Text("Butterfly Volume").font(.custom("Inter-Bold", size: 20)).foregroundColor(Color(red: 0.757, green: 0.827, blue: 0.965)).frame(maxWidth: .infinity,alignment: .leading).padding(.leading, 28)
                        Text("\(String(butterflyVolume))m").font(.custom("Inter-Bold", size: 20)).foregroundColor(.white).padding(.trailing, 28)
                        
                    }
                                Rectangle().fill(Color(red: 0.145, green: 0.145, blue: 0.145)).frame(height: 2)
                    HStack{
                        Text("Backstroke Volume").font(.custom("Inter-Bold", size: 20)).foregroundColor(Color(red: 0.757, green: 0.827, blue: 0.965)).frame(maxWidth: .infinity,alignment: .leading).padding(.leading, 28)
                        Text("\(String(backstrokeVolume))m").font(.custom("Inter-Bold", size: 20)).foregroundColor(.white).padding(.trailing, 28)
                    }
                                Rectangle().fill(Color(red: 0.145, green: 0.145, blue: 0.145)).frame(height: 2)
                    HStack{
                        Text("Breaststroke Volume").font(.custom("Inter-Bold", size: 20)).foregroundColor(Color(red: 0.757, green: 0.827, blue: 0.965)).frame(maxWidth: .infinity,alignment: .leading).padding(.leading, 28)
                        Text("\(String(breaststrokeVolume))m").font(.custom("Inter-Bold", size: 20)).foregroundColor(.white).padding(.trailing, 28)
                        
                    }
                }
            }
            
            ZStack{
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(Color(red: 0.188, green: 0.424, blue: 0.878)).frame(width: .infinity, height: 200).padding()
                
                VStack {
                                    
                    HStack {
                        Text("Average per workout").font(.custom("Inter-Bold", size: 20)).foregroundColor(Color(red: 0.757, green: 0.827, blue: 0.965)).frame(maxWidth: .infinity,alignment: .leading).padding(.leading, 28)
                        Text("\(String(frontcrawlVolume))m").font(.custom("Inter-Bold", size: 20)).foregroundColor(.white).padding(.trailing, 28)
                        
                    }
                            Rectangle().fill(Color(red: 0.145, green: 0.145, blue: 0.145)).frame(height: 2)
                    HStack{
                        Text("Highest workout volume").font(.custom("Inter-Bold", size: 20)).foregroundColor(Color(red: 0.757, green: 0.827, blue: 0.965)).frame(maxWidth: .infinity,alignment: .leading).padding(.leading, 28)
                        Text("\(highestVolume)").font(.custom("Inter-Bold", size: 20)).foregroundColor(.white).padding(.trailing, 28)
                        
                    }
                                Rectangle().fill(Color(red: 0.145, green: 0.145, blue: 0.145)).frame(height: 2)
                    HStack{
                        Text("Favorite stroke").font(.custom("Inter-Bold", size: 20)).foregroundColor(Color(red: 0.757, green: 0.827, blue: 0.965)).frame(maxWidth: .infinity,alignment: .leading).padding(.leading, 28)
                        Text("\(getFavorite())").font(.custom("Inter-Bold", size: 20)).foregroundColor(.white).padding(.trailing, 28)
                    }
                                Rectangle().fill(Color(red: 0.145, green: 0.145, blue: 0.145)).frame(height: 2)
                    HStack{
                        Text("Daily volume").font(.custom("Inter-Bold", size: 20)).foregroundColor(Color(red: 0.757, green: 0.827, blue: 0.965)).frame(maxWidth: .infinity,alignment: .leading).padding(.leading, 28)
                        Text("\(String(breaststrokeVolume))m").font(.custom("Inter-Bold", size: 20)).foregroundColor(.white).padding(.trailing, 28)
                        
                    }
                }
            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color(red: 0.145, green: 0.145, blue: 0.145))
            .navigationBarTitle("", displayMode: .inline)
        
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
