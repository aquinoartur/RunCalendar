//
//  Runner.swift
//  RunCalendar
//
//  Created by Adelmo Artur de  Aquino on 27/10/24.
//

import Foundation


struct RunOption: Identifiable, Codable, Hashable {
    var id = UUID()
    
    let name: String
    let description: String
    let date: Date
    let city: String
    let time: String
    let subscription: String
    
}
