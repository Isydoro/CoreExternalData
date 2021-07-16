//
//  ViewModel.swift
//  CoreExternalData
//
//  Created by Isidoro Fiore on 7/15/21.
//

import Foundation

import SwiftUI

struct ViewModel: Decodable, Hashable {
    
    var question: String
    var answers:[String] = []

    var correctIndex: Int16
    var module: Int16
    var lesson: Int16
    var num: Int16
    var feedback: String
    var picture: String
   
   
}
