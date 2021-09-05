//
//  WorkoutItem.swift
//  Swoleo
//
//  Created by Sami Amer on 9/5/21.
//

import Foundation

struct WorkoutItem: Identifiable, Codable{
    var id = UUID()
    let name: String
    let type: String
    let initialAmount: Int
    var max = 0 // make this update with new sets, within the struct
    var history: Array<Int> // use this for graphs and record keeping
}

class Workouts: ObservableObject {
    @Published var items = [WorkoutItem](){
        didSet{
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey:"Items")
            }
        }
    }
    
    init(){
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([WorkoutItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}
