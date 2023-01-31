//
//  TrainingManagement.swift
//  swimpal
//
//  Created by Samuel Hervás Gómez on 1/26/23.
//

import Foundation
import CoreGraphics

struct Exercises: Hashable {
    var distance: Int
    var title: String
    var reps: Int
    var style: String
    var speedImg: String
    
}

struct Workout: Hashable & Identifiable {
    let id = UUID()
    var exercises: [Exercises]
    var warmup: [Exercises]
    var date: Date
    var distance: Int
    var title: String
    var day: String
}

struct WorkoutVolume: Hashable {
    var butterfly: Int
    var backstroke: Int
    var breaststroke: Int
    var frontcrawl: Int
}

struct TrainingPlan: Hashable {
    var workouts: [Workout]
}

func createTrainingDay(idealStrokes: [String], maxDistance: Int, day: String, date: Date) -> Workout {
    
    let P = 0.2
    
    let distances = [50, 100, 200, 300]
    let reps = [3, 4, 5]
    let titles = ["Kicks", "Pull buoy", "Fast kick", "Normal"]
    let styles = ["Butterfly", "Frontcrawl", "Breaststroke", "Backstroke"]
    let speedImgs: [String] = ["small.fish.black", "shark.black"]
    
    var desiredDistance = maxDistance
    
    //sanitise minimum distance of 1500 to create a reasonable workout
    if desiredDistance < 1500 {
        desiredDistance = 1500
    }
    
    let exerciseArray = [
        //kicks
        Exercises(distance: distances[0], title: titles[0], reps: reps[2], style: styles[0], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[1], title: titles[0], reps: reps[1], style: styles[0], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[2], title: titles[0], reps: reps[0], style: styles[0], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[0], title: titles[0], reps: reps[2], style: styles[1], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[1], title: titles[0], reps: reps[1], style: styles[1], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[2], title: titles[0], reps: reps[0], style: styles[1], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[0], title: titles[0], reps: reps[2], style: styles[3], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[1], title: titles[0], reps: reps[1], style: styles[3], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[2], title: titles[0], reps: reps[0], style: styles[3], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[0], title: titles[0], reps: reps[2], style: styles[2], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[1], title: titles[0], reps: reps[1], style: styles[2], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[2], title: titles[0], reps: reps[0], style: styles[2], speedImg: speedImgs.randomElement()!),
        
        //Pull buoy
        Exercises(distance: distances[0], title: titles[1], reps: reps[2], style: styles[0], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[1], title: titles[1], reps: reps[1], style: styles[0], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[2], title: titles[1], reps: reps[0], style: styles[0], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[0], title: titles[1], reps: reps[2], style: styles[1], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[1], title: titles[1], reps: reps[1], style: styles[1], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[2], title: titles[1], reps: reps[0], style: styles[1], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[0], title: titles[1], reps: reps[2], style: styles[3], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[1], title: titles[1], reps: reps[1], style: styles[3], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[2], title: titles[1], reps: reps[0], style: styles[3], speedImg: speedImgs.randomElement()!),
        
        //Fast kicks
        Exercises(distance: distances[0], title: titles[2], reps: reps[2], style: styles[0], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[1], title: titles[2], reps: reps[1], style: styles[0], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[2], title: titles[2], reps: reps[0], style: styles[0], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[0], title: titles[2], reps: reps[2], style: styles[1], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[1], title: titles[2], reps: reps[1], style: styles[1], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[2], title: titles[2], reps: reps[0], style: styles[1], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[0], title: titles[2], reps: reps[2], style: styles[3], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[1], title: titles[2], reps: reps[1], style: styles[3], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[2], title: titles[2], reps: reps[0], style: styles[3], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[0], title: titles[2], reps: reps[2], style: styles[2], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[1], title: titles[2], reps: reps[1], style: styles[2], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[2], title: titles[2], reps: reps[0], style: styles[2], speedImg: speedImgs.randomElement()!),
        
    ]
    
    let normalExerciseArray = [
        //Normal Swim
        Exercises(distance: distances[1], title: titles[3], reps: reps[2], style: styles[0], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[2], title: titles[3], reps: reps[1], style: styles[0], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[3], title: titles[3], reps: reps[0], style: styles[0], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[1], title: titles[3], reps: reps[2], style: styles[1], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[2], title: titles[3], reps: reps[1], style: styles[1], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[3], title: titles[3], reps: reps[0], style: styles[1], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[1], title: titles[3], reps: reps[2], style: styles[3], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[2], title: titles[3], reps: reps[1], style: styles[3], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[3], title: titles[3], reps: reps[0], style: styles[3], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[1], title: titles[3], reps: reps[0], style: styles[2], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[2], title: titles[3], reps: reps[0], style: styles[2], speedImg: speedImgs.randomElement()!),
        Exercises(distance: distances[3], title: titles[3], reps: reps[0], style: styles[2], speedImg: speedImgs.randomElement()!),
    ]
    
    let firstExer = exerciseArray.randomElement()!
    let warmExer = exerciseArray.randomElement()!
    let warmExer2 = Exercises(distance: distances[1], title: titles[3], reps: reps[1], style: styles[1], speedImg: speedImgs.randomElement()!)
    var workoutArr: [Exercises] = [firstExer]
    let warmupArr: [Exercises] = [warmExer, warmExer2]
    //while maxdistance - 100 < totalSumOfWorkout (reps x distance) create exercises and append to exerciseArray
    //create training day workout object
    var workoutDistance = (firstExer.distance * firstExer.reps) + (warmExer.distance * warmExer.reps) + (warmExer2.distance * warmExer2.reps)
    
    
    while (desiredDistance - 500) > workoutDistance {
        //P probability for exercise to change to one of random idealstrokes
        let choosenStroke = idealStrokes.randomElement()
        
        var exer1 = exerciseArray.randomElement()
        var exer2 = normalExerciseArray.randomElement()
        
        if P >= Double.random(in: 0...1) {
            exer1!.style = choosenStroke ?? "Frontcrawl"
        }
        if P >= Double.random(in: 0...1) {
            exer2!.style = choosenStroke ?? "Frontcrawl"
        }
        
        workoutArr.append(exer1!)
        workoutArr.append(exer2!)
        
        workoutDistance += (exer1!.distance * exer1!.reps) + (exer2!.distance * exer2!.reps)
    }
    
    //workout titles
    let workTitles: [String] = ["Endurance Training", "Leg Training", "Freestyle", "Sprints", "Arm Training", "Stroke Mix"]
    
    let title = workTitles.randomElement()!
    
    return Workout(exercises: workoutArr, warmup: warmupArr, date: date, distance: workoutDistance, title: title, day: day)
    
    
}

func createTrainingPlan() -> TrainingPlan {
    //get userdefaults for use
    //var action: Bool = UserDefaults.standard.bool(forKey: "trainingPlan")
    
    //days
    let mon: Bool = UserDefaults.standard.bool(forKey: "mon")
    let tue: Bool = UserDefaults.standard.bool(forKey: "tue")
    let wed: Bool = UserDefaults.standard.bool(forKey: "wed")
    let thu: Bool = UserDefaults.standard.bool(forKey: "thu")
    let fri: Bool = UserDefaults.standard.bool(forKey: "fri")
    let sat: Bool = UserDefaults.standard.bool(forKey: "sat")
    let sun: Bool = UserDefaults.standard.bool(forKey: "sun")
    
    //strokes for improvement
    let fro: Bool = UserDefaults.standard.bool(forKey: "frontcrawl")
    let but: Bool = UserDefaults.standard.bool(forKey: "butterfly")
    let bre: Bool = UserDefaults.standard.bool(forKey: "breaststroke")
    let bac: Bool = UserDefaults.standard.bool(forKey: "backstroke")
    
    var strokes: [String] = []
    if fro {
        strokes.append("Frontcrawl")
    }
    if but {
        strokes.append("Butterfly")
    }
    if bre {
        strokes.append("Breaststroke")
    }
    if bac {
        strokes.append("Backstroke")
    }
    
    //distance per workout
    let maxDistance: Int = UserDefaults.standard.integer(forKey: "meters")
    
    
    //Create workout per day
    var workouts: [Workout] = []
    
    let now = Date()
    let calendar = Calendar.current
    let weekDay = calendar.component(.weekday, from: now)
    let monday = now.addingTimeInterval(-Double((weekDay - calendar.firstWeekday) * 24 * 60 * 60))
    let tuesday = now.addingTimeInterval(-Double((weekDay - (calendar.firstWeekday + 1) % 7) * 24 * 60 * 60))
    let wednesday = now.addingTimeInterval(-Double((weekDay - (calendar.firstWeekday + 2) % 7) * 24 * 60 * 60))
    let thursday = now.addingTimeInterval(-Double((weekDay - (calendar.firstWeekday + 3) % 7) * 24 * 60 * 60))
    let friday = now.addingTimeInterval(-Double((weekDay - (calendar.firstWeekday + 4) % 7) * 24 * 60 * 60))
    let saturday = now.addingTimeInterval(-Double((weekDay - (calendar.firstWeekday + 5) % 7) * 24 * 60 * 60))
    let sunday = now.addingTimeInterval(-Double((weekDay - (calendar.firstWeekday + 6) % 7) * 24 * 60 * 60))
    
    
    if mon {
        workouts.append(createTrainingDay(idealStrokes: strokes, maxDistance: maxDistance, day: "Monday", date: monday))
    }
    if tue {
        workouts.append(createTrainingDay(idealStrokes: strokes, maxDistance: maxDistance, day: "Tuesday", date: tuesday))
    }
    if wed {
        workouts.append(createTrainingDay(idealStrokes: strokes, maxDistance: maxDistance, day: "Wednesday", date: wednesday))
    }
    if thu {
        workouts.append(createTrainingDay(idealStrokes: strokes, maxDistance: maxDistance, day: "Thursday", date: thursday))
    }
    if fri {
        workouts.append(createTrainingDay(idealStrokes: strokes, maxDistance: maxDistance, day: "Friday", date: friday))
    }
    if sat {
        workouts.append(createTrainingDay(idealStrokes: strokes, maxDistance: maxDistance, day: "Saturday", date: saturday))
    }
    if sun {
        workouts.append(createTrainingDay(idealStrokes: strokes, maxDistance: maxDistance, day: "Sunday", date: sunday))
    }
    
    //return created training plan for week
    return TrainingPlan(workouts: workouts)

}

func calculateWorkoutVolume(workout: Workout) -> WorkoutVolume {
    var butterflyVolume = 0
    var backstrokeVolume = 0
    var breaststokeVolume = 0
    var frontcrawlVolume = 0
    
    let styles = ["Butterfly", "Frontcrawl", "Breaststroke", "Backstroke"]

    //Calculate volume in warmup exercises
    for exercise in workout.warmup {
        let volume = exercise.reps * exercise.distance
        if (exercise.style == styles[0]) {
            butterflyVolume += volume
        } else if (exercise.style == styles[1]) {
            frontcrawlVolume += volume
        } else if (exercise.style == styles[2]) {
            breaststokeVolume += volume
        } else {
            backstrokeVolume += volume
        }
    }
    
    //Calculate volume in main set exercises
    for exercise in workout.exercises{
        let volume = exercise.reps * exercise.distance
        if (exercise.style == styles[0]) {
            butterflyVolume += volume
        } else if (exercise.style == styles[1]) {
            frontcrawlVolume += volume
        } else if (exercise.style == styles[2]) {
            breaststokeVolume += volume
        } else {
            backstrokeVolume += volume
        }
    }
    
    return WorkoutVolume(butterfly: butterflyVolume, backstroke: backstrokeVolume, breaststroke: breaststokeVolume, frontcrawl: frontcrawlVolume)
    
}
