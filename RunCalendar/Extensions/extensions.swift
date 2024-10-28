//
//  extensions.swift
//  RunCalendar
//
//  Created by Adelmo Artur de  Aquino on 27/10/24.
//

import Foundation

extension Date {
    // Método para converter uma Date para o formato americano "MM/dd/yyyy"
    func formatToAmerican() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"  // Define o formato americano
        formatter.locale = Locale(identifier: "en_US") // Define a localização para o formato americano
        return   formatter.date(from: formatter.string(from: self))
    }

    // Método para converter uma Date para o formato brasileiro "dd/MM/yyyy"
    func formatToBrazilian() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"  // Define o formato brasileiro
        formatter.locale = Locale(identifier: "pt_BR") // Define a localização para o formato brasileiro
        return formatter.string(from: self)
    }
}

extension Calendar {
    func generateDates(inside interval: DateInterval, matching components: DateComponents) -> [Date] {
        var dates: [Date] = []
        var current = interval.start
        while current < interval.end {
            dates.append(current)
            current = self.date(byAdding: .day, value: 1, to: current)!
        }
        return dates
    }
}
