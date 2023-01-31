//
//  TrainingView.swift
//  swimpal
//
//  Created by Samuel Hervás Gómez on 1/21/23.
//

import SwiftUI





struct TrainingView: View {
        
    let tutorialDone = UserDefaults.standard.bool(forKey: "trainingPlan")
    @State private var trainingPlan: TrainingPlan = createTrainingPlan()
    
    //day states from memory
    @AppStorage("mon") var mon: Bool = false
    @AppStorage("tue") var tue: Bool = false
    @AppStorage("wed") var wed: Bool = false
    @AppStorage("thu") var thu: Bool = false
    @AppStorage("fri") var fri: Bool = false
    @AppStorage("sat") var sat: Bool = false
    @AppStorage("sun") var sun: Bool = false
    
    @State private var action: Int? = 0
    
    @State private var selectedWorkout: Workout? = nil
    
    private func converDateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter.string(from: date)
    }
    

    
    var body: some View {
        NavigationView{
        VStack{
            
            
            Text("TRAINING").font(.custom("Inter-Bold", size: 35)).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .leading).padding()
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(mon ? .white : Color(red: 0.188, green: 0.424, blue: 0.878)).frame(width: 40, height: 35)
                    Text("Mon").font(.custom("Inter-Bold", size: 14)).foregroundColor(mon ? Color(red: 0.145, green: 0.145, blue: 0.145) : .white)
                }.onTapGesture {
                    //toggle
                    mon.toggle()
                    trainingPlan = createTrainingPlan()
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(tue ? .white : Color(red: 0.188, green: 0.424, blue: 0.878)).frame(width: 40, height: 35)
                    Text("Tue").font(.custom("Inter-Bold", size: 14)).foregroundColor(tue ? Color(red: 0.145, green: 0.145, blue: 0.145) : .white)
                }.onTapGesture {
                    //toggle
                    tue.toggle()
                    trainingPlan = createTrainingPlan()
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(wed ? .white : Color(red: 0.188, green: 0.424, blue: 0.878)).frame(width: 40, height: 35)
                    Text("Wed").font(.custom("Inter-Bold", size: 14)).foregroundColor(wed ? Color(red: 0.145, green: 0.145, blue: 0.145) : .white)
                }.onTapGesture {
                    //toggle
                    wed.toggle()
                    trainingPlan = createTrainingPlan()
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(thu ? .white : Color(red: 0.188, green: 0.424, blue: 0.878)).frame(width: 40, height: 35)
                    Text("Thu").font(.custom("Inter-Bold", size: 14)).foregroundColor(thu ? Color(red: 0.145, green: 0.145, blue: 0.145) : .white)
                }.onTapGesture {
                    //toggle
                    thu.toggle()
                    trainingPlan = createTrainingPlan()
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(fri ? .white : Color(red: 0.188, green: 0.424, blue: 0.878)).frame(width: 40, height: 35)
                    Text("Fri").font(.custom("Inter-Bold", size: 14)).foregroundColor(fri ? Color(red: 0.145, green: 0.145, blue: 0.145) : .white)
                }.onTapGesture {
                    //toggle
                    fri.toggle()
                    trainingPlan = createTrainingPlan()
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(sat ? .white : Color(red: 0.188, green: 0.424, blue: 0.878)).frame(width: 40, height: 35)
                    Text("Sat").font(.custom("Inter-Bold", size: 14)).foregroundColor(sat ? Color(red: 0.145, green: 0.145, blue: 0.145) : .white)
                }.onTapGesture {
                    //toggle
                    sat.toggle()
                    trainingPlan = createTrainingPlan()
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(sun ? .white : Color(red: 0.188, green: 0.424, blue: 0.878)).frame(width: 40, height: 35)
                    Text("Sun").font(.custom("Inter-Bold", size: 14)).foregroundColor(sun ? Color(red: 0.145, green: 0.145, blue: 0.145) : .white)
                }.onTapGesture {
                    //toggle
                    sun.toggle()
                    trainingPlan = createTrainingPlan()
                }
                
                
            }
            Spacer()
            VStack {
                Spacer()
                ScrollView{
                    ForEach(trainingPlan.workouts, id: \.id) { workout in
                        
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(Color(red: 0.188, green: 0.424, blue: 0.878)).frame(width: .infinity)
                    NavigationLink (destination: WorkoutView(workout: workout), tag: workout, selection: $selectedWorkout){
                    HStack{
                        VStack{
                            
                            Text(workout.title).font(.custom("Inter-Bold", size: 24)).foregroundColor(.white).frame(maxWidth: .infinity,alignment: .leading).padding([.top], 15).padding(.leading, 25)
                            Text(String(workout.distance) + "m (" + workout.day  + ")").font(.custom("Inter-BI", size: 20)).foregroundColor(.white).frame(maxWidth: .infinity,alignment: .leading).padding(.bottom, 15).padding(.leading, 25)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: "play.circle.fill").font(.system(size: 38)).foregroundColor(.white).padding()
                        
                            
                    }.onTapGesture{
                        self.selectedWorkout = workout
                    }
                        
                    }
                }.padding(12)
                .frame(maxWidth: .infinity, alignment: .trailing)
                    }}
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .background(Color(red: 0.145, green: 0.145, blue: 0.145)).cornerRadius(25).padding(.bottom, -50)
            
            
        
        
    }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color(red: 0.188, green: 0.424, blue: 0.878))
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }}
}



struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView()
    }
}
