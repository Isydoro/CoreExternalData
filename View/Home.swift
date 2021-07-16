//
//  Home.swift
//  CoreExternalData
//
//  Created by Isidoro Fiore on 7/15/21.
//
//
//  Home.swift
//  JsonCOREDATA
//
//  Created by Isidoro Fiore on 7/3/21.
//

import SwiftUI

struct Home: View {
    @StateObject var jsonModel = JsonViewModel()
    @Environment(\.managedObjectContext) var context
    
    
    var body: some View {
        VStack{
            if jsonModel.videos.isEmpty{
                
            
                
                ProgressView()
                    .onAppear(perform: {
                        
                        jsonModel.fetchData(context: context)
                        
                        
                    })
            
            }
            else{
                
               // print("prioviamo sta lista")
                List(jsonModel.videos, id: \.self){ video in
                    CardView(video: video)
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
        .navigationTitle("Fetched Json")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                
                Button(action: {
                        jsonModel.videos.removeAll()}, label:{
                            
                    Image(systemName: "arrow.clockwise.circle")
                        .font(.title)
                })
                
            }
        }
    }
}
