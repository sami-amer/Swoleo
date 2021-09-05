//
//  AddWorkoutView.swift
//  Swoleo
//
//  Created by Sami Amer on 9/5/21.
//

import SwiftUI

struct AddWorkoutView: View {
    @State private var name = ""
    @State private var type = "Weight"
    @State private var amount = ""
    
    @ObservedObject var workouts: Workouts
    
    @Environment(\.presentationMode) var presentationMode
    static let types = ["Weight", "Time Circuit"] // Add functionality to differentiate these two
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Workout Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self){
                        Text($0)
                    }
                }
                TextField("Starting Weight (lb)", text: $amount) // add functionality for adding distinct sets
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add workout")
            .navigationBarItems(trailing: Button("Save"){
                if let actualAmount = Int(self.amount){
                    let item = WorkoutItem(name: self.name, type: self.type, initialAmount: actualAmount, history: [0])
                    self.workouts.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
            })
            
        }
    }
}

struct AddWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkoutView(workouts: Workouts())
    }
}
