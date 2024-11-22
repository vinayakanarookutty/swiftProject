//
//  ContentView.swift
//  ExamApp
//
//  Created by ddukk9 on 22/11/24.
//

import SwiftUI

struct ContentView: View {
    @State var selector = 1
    
    var body: some View {
        TabView(selection: $selector ){

                FoodView().tabItem {
                    Image(systemName: "magnifyingglass")
                    
                    
                }
                .tag(1)
                Fav().tabItem{
                    Image(systemName: "star.fill")
                }
                .tag(2)
            
        
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
