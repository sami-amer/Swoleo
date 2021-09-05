//
//  ContentView.swift
//  Swoleo
//
//  Created by Sami Amer on 8/24/21.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @State private var placeholderDayArrayTop = ["Day 1", "Day 3","Day 5 "] // use if else and null buttons, make lists same size
    @State private var placeholderDayArrayBot = ["Day 2", "Day 4", "Day 6"]
    
    // Next Steps: Figure out how to fix the button listings, then use the notes to abstract away the button style we want.
    var body: some View {
        
        NavigationView{
            VStack(spacing: 30){
                
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false){
                    VStack{
                        HStack{ // look into UIStackview
                            ForEach(placeholderDayArrayTop, id: \.self){ day in
                                VStack{ // might need to make this a list instead of scroll + Stack
                                    Button("\(day)"){
                                        // Start Workout
                                    }.padding(45).background(Color.orange).clipShape(RoundedRectangle(cornerSize: CGSize(width: 15,height: 20)), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/).foregroundColor(.black)

                                }
                            }
                        Spacer()}
                        HStack(alignment: .firstTextBaseline){
                            ForEach(placeholderDayArrayBot, id: \.self){ day in
                                VStack{ // might need to make this a list instead of scroll + Stack
                                    Button("\(day)"){
                                        // Start Workout
                                    }.padding(45).background(Color.orange).clipShape(RoundedRectangle(cornerSize: CGSize(width: 15,height: 20)), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/).foregroundColor(.black)
                                        
                                }
                            
                            }
                        
                            Spacer()}
                        
                    }
                   
                }
                
                
                
                Button("New Day"){
                    //Go to new day view
                }.padding(75).background(Color.orange).clipShape(RoundedRectangle(cornerSize: CGSize(width: 15,height: 20)), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/).foregroundColor(.black)
                

                Button("Live Day"){
                    // go to live day view
                }.padding(75).background(Color.orange).clipShape(RoundedRectangle(cornerSize: CGSize(width: 15,height: 20)), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/).foregroundColor(.black)
                
                Spacer()
            }
            .navigationTitle("Swoleo").font(.headline)}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
