//
//  ViewModel.swift
//  CoreExternalData
//
//  Created by Isidoro Fiore on 7/15/21.
//

import Foundation
import SwiftUI
import CoreData



class JsonViewModel: ObservableObject {
    
    
    
    
    
    
    
    private func readLocalFile(forName name: String) -> Data? {
           do {
               if let bundlePath = Bundle.main.path(forResource: name,
                                                    ofType: "json"),
                   let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                 
                return jsonData
               }
           } catch {
               print(error)
           }
           
           return nil
       }
    
    
    
    @Published var videos: [ViewModel] = []
    
    
    func saveData(context: NSManagedObjectContext){
        
        videos.forEach{(data) in
            
            let entity = Quiz(context: context)
            entity.question = data.question
            entity.answ1 = data.answers[0]
            entity.answ2 = data.answers[1]
            entity.answ3 = data.answers[2]
            entity.answ4 = data.answers[3]
            entity.correctIndex = data.correctIndex
            entity.module = data.module
            entity.lesson = data.lesson
            entity.feedback = data.feedback
            entity.picture = data.picture
            entity.num = data.num
//
            
          //  entity.correctIndex = data.correctIndex
       
        }
        
        
        do{
            try context.save()
            print("success")
        }
        catch{
            print("error")
        }
        
        
        
        
    }
    
    func fetchData(context: NSManagedObjectContext){

        let jsonData = readLocalFile(forName: "Apu")
       // print("jsonData", jsonData)
       var videos = try! JSONDecoder().decode([ViewModel].self, from: jsonData!)
        
        //print("jsonData", videos)
        
        
        do{
            videos = try! JSONDecoder().decode([ViewModel].self, from: jsonData!)
            DispatchQueue.main.async {
                self.videos = videos
                
                self.saveData(context: context)
            }
        }
        catch
        {
            print("error")
        }
        
     
    }
    
   
   
}

