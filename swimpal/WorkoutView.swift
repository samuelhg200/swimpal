//
//  WorkoutView.swift
//  swimpal
//
//  Created by Samuel Hervás Gómez on 1/27/23.
//

import SwiftUI

struct WorkoutView: View {
    var workout: Workout
    
    @State private var action: Int? = 0
    @Environment(\.dismiss) var dismiss
    
    let defaults = UserDefaults.standard

    private func returnRandomIcon () -> some View {
        let rand = Int.random(in: 1...2)
        if rand == 1 {
            return Image("small.fish.black").resizable().aspectRatio(contentMode: .fit).frame(height: 24).padding(.trailing, 10)
        } else {
            return Image("shark.black").resizable().aspectRatio(contentMode: .fit).frame(height: 45).padding(.trailing, 10)
        }
        
    }
    
    @AppStorage("frontcrawlVolume") var frontcrawlVolume: Int = 0
    @AppStorage("breaststrokeVolume") var breaststrokeVolume: Int = 0
    @AppStorage("backstrokeVolume") var backstrokeVolume: Int = 0
    @AppStorage("butterflyVolume") var butterflyVolume: Int = 0
    @AppStorage("highestVolume") var highestVolume: Int = 0
    
    var body: some View {
        VStack{
        
            Text(workout.title).font(.custom("Inter-Bold", size: 32)).frame(width: .infinity).foregroundColor(.white).padding()
            
            ScrollView{
            VStack {
                Spacer()
                HStack{
                    Text("Slow").font(.custom("Inter-Bold", size: 17)).foregroundColor(.white)
                    Image("small.fish.blue").resizable().aspectRatio(contentMode: .fit).frame(height: 28).padding(.trailing, 10)
                    Text("Fast").font(.custom("Inter-Bold", size: 17)).foregroundColor(.white)
                    Image("shark.blue").resizable().aspectRatio(contentMode: .fit).frame(height: 38).padding(.trailing, 10)
                    
                }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 30)
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(Color(red: 0.188, green: 0.424, blue: 0.878)).frame(width: .infinity)
                    
                    VStack {
                        
                        ForEach(workout.warmup, id: \.self) { exercise in
                            
                            HStack{
                                Circle()
                                    .fill(Color(red: 0.145, green: 0.145, blue: 0.145))
                                            .frame(width: 20, height: 20).padding(.trailing, 5)
                                            
                                VStack{
                                    Text("\(String(exercise.reps))x\(String(exercise.distance)) \(String(exercise.title))").font(.custom("Inter-Bold", size: 18)).foregroundColor(.white).frame(maxWidth: .infinity,alignment: .leading)
                                                            
                                    Text(" ("+exercise.style+")").font(.custom("Inter-BI", size: 16)).foregroundColor(.white).frame(maxWidth: .infinity,alignment: .leading)
                                }
                                Image("small.fish.black").resizable().aspectRatio(contentMode: .fit).frame(height: 24).padding(.trailing, 10)
                                
                            }.padding(.leading, 20).padding([.top, .bottom], 8)
                            Rectangle().fill(Color(red: 0.145, green: 0.145, blue: 0.145)).frame(height: 2)
                    }
                        
                    
                    }
                
                }.padding(18)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(Color(red: 0.188, green: 0.424, blue: 0.878)).frame(width: .infinity)
                    VStack {
                        ForEach(workout.exercises, id: \.self) { exercise in
                            HStack{
                                Circle()
                                    .fill(Color(red: 0.145, green: 0.145, blue: 0.145))
                                            .frame(width: 20, height: 20).padding(.trailing, 5)
                                VStack{
                                    
                                    Text(String(exercise.reps) + "x" + String(exercise.distance) + " " + exercise.title).font(.custom("Inter-Bold", size: 18)).foregroundColor(.white).frame(maxWidth: .infinity,alignment: .leading)
                                    Text("("+exercise.style+")").font(.custom("Inter-BI", size: 16)).foregroundColor(.white).frame(maxWidth: .infinity,alignment: .leading)
                                                            
                                }
                                Image("\(exercise.speedImg)").resizable().aspectRatio(contentMode: .fit).frame(height: exercise.speedImg == "small.fish.black" ? 24 : 45).padding(.trailing, 10)
                        }.padding(.leading, 20).padding([.top, .bottom], 8)
                            Rectangle().fill(Color(red: 0.145, green: 0.145, blue: 0.145)).frame(height: 2)
                        }
                    }
                        
                    
                }.padding(18)
                .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                Spacer()
                Button("Continue") {
                    let workoutVolume: WorkoutVolume = calculateWorkoutVolume(workout: workout)
                    //record workout volumes
                    defaults.set(workoutVolume.butterfly + butterflyVolume, forKey: "butterflyVolume")
                    defaults.set(workoutVolume.breaststroke + breaststrokeVolume, forKey: "breaststrokeVolume")
                    defaults.set(workoutVolume.frontcrawl + frontcrawlVolume, forKey: "frontcrawlVolume")
                    defaults.set(workoutVolume.backstroke +  backstrokeVolume, forKey: "backstrokeVolume")
                    
                    //check if new highest volume and update stats
                    if workout.distance > highestVolume {
                        defaults.set(workout.distance, forKey: "highestVolume")
                    }
                    
                    dismiss()
                }
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .foregroundColor(Color(red: 0.145, green: 0.145, blue: 0.145))
                .font(.custom("Inter-Bold", size: 24))
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .background(Color(red: 0.145, green: 0.145, blue: 0.145)).cornerRadius(25).padding(.bottom, -18)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color(red: 0.188, green: 0.424, blue: 0.878))
            .navigationBarTitle("", displayMode: .inline)
            
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        
        let workout = Workout(exercises: [], warmup: [], date:Date(), distance: 2000, title: "Test", day: "Monday")
        WorkoutView(workout: workout)
    }
}
