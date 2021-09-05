//
//  DayItem.swift
//  Swoleo
//
//  Created by Sami Amer on 9/5/21.
//

import Foundation

struct DayItem: Identifiable, Codable{
    var id = UUID()
    let name: String
    let type: String
    var max: Int // make this update with new sets
    var history: Array<Int> // use this for graphs and record keeping
}

class Days: ObservableObject {
    @Published var items = [DayItem](){
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
            if let decoded = try? decoder.decode([DayItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}
