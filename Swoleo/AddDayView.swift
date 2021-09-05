//
//  AddDayView.swift
//  Swoleo
//
//  Created by Sami Amer on 9/5/21.
//

import SwiftUI

struct AddDayView: View {
    @ObservedObject var workouts = Workouts()
    @State private var showingAddWorkout = false
    
    func removeItems(at offsets: IndexSet) {
        workouts.items.remove(atOffsets: offsets)
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(workouts.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()
                        Text("\(item.initialAmount) lbs")
                    }
                }.onDelete(perform: removeItems)
            }.navigationBarItems(trailing:
                                    Button(action: {
                                        self.showingAddWorkout = true
                                    }) {
                                        Image(systemName: "plus")
                                    }
                                )
            .navigationBarTitle("New Day")
        }.sheet(isPresented: $showingAddWorkout){
            AddWorkoutView(workouts: self.workouts)
        }
    }
}

struct AddDayView_Previews: PreviewProvider {
    static var previews: some View {
        AddDayView()
    }
}
