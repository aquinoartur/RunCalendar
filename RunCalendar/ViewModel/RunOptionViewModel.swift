//
//  RunOptionViewModel.swift
//  RunCalendar
//
//  Created by Adelmo Artur de  Aquino on 27/10/24.
//

import Foundation

@Observable
class RunOptionViewModel {
    
     var options: [RunOption] = []
     var isLoading: Bool = false
     var isError: Bool = false
    
    
    func fetchOptions() {
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            
            self.isLoading = false
            self.isError = false
            
            self.options = [
                RunOption(
                    name: "Meia Maratona da Serra",
                    description: "Na Serra de Martins/RN",
                    date: Calendar.current.date(byAdding: .day, value: 3, to: Date()) ?? Date(),
                    city: "Martins/RN",
                    time: "06:00",
                    subscription: "R$ 60,00"
                ),
                RunOption(
                    name: "Corrida de Serrinha",
                    description: "Na Serra de Martins/RN",
                    date: Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date(),
                    city: "Martins/RN",
                    time: "06:00",
                    subscription: "R$ 60,00"
                ),
                RunOption(
                    name: "Corrida de PDF",
                    description: "Na Serra de Martins/RN",
                    date: Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date(),
                    city: "Martins/RN",
                    time: "06:00",
                    subscription: "R$ 60,00"
                ),
               
            ]
        }
    }
    
}

let runOptionMock = RunOption(
    name: "Meia Maratona da Serra",
    description: "Na Serra de Martins/RN",
    date: Calendar.current.date(byAdding: .day, value: 10, to: Date()) ?? Date(),
    city: "Martins/RN",
    time: "06:00",
    subscription: "R$ 60,00"
)
