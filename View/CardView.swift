//
//  CardView.swift
//  CoreExternalData
//
//  Created by Isidoro Fiore on 7/15/21.
//

//
//  CardView.swift
//  JsonCOREDATA
//
//  Created by Isidoro Fiore on 7/3/21.
//

import SwiftUI

struct CardView: View {
    var video: ViewModel
  
   
    
    var body: some View {
      
        VStack(alignment: .leading, spacing: 10, content: {
            Text("eccomi")
            Text(video.question)
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.black)
            
            Text(video.answers[0])
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.gray)
            
          
        })
    }
}

