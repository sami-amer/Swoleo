//
//  ContentView.swift
//  Swoleo
//
//  Created by Sami Amer on 8/24/21.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var placeholderDayArray = ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5", "Day 6"]
    
    var body: some View {
        
        NavigationView{
            VStack(spacing: 30){
                
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(placeholderDayArray, id: \.self){ day in

                                Button("\(day)"){
                                    // Start Workout
                                }.padding(85).background(Color.orange).clipShape(RoundedRectangle(cornerSize: CGSize(width: 15,height: 20)), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/).foregroundColor(.black)
 
                        }
                        Button("Placeholder"){
                            //This is the add new day button TODO: Change Style, add functionality
                        }.padding(85).background(Color.orange).clipShape(RoundedRectangle(cornerSize: CGSize(width: 15,height: 20)), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/).foregroundColor(.black)
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
