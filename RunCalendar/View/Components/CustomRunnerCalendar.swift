//
//  CalendarioComEventosView.swift
//  RunCalendar
//
//  Created by Adelmo Artur de  Aquino on 27/10/24.
//
import SwiftUI



struct CustomRunnerCalendar: View {
    let options: [RunOption]
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var currentMonth: Date = Date()
    @State private var direction: CGFloat = 0
    
    @Bindable var calendar: CalendarEventsViewModel
    
    
    var isDarkMode: Bool {
        colorScheme == .dark
    }
    
    var body: some View {
        VStack {
           
            HStack {
                Button(action: { currentMonth = setMonth(increment: false ) }) {
                    Image(systemName: "chevron.left")
                        .tint(.green)
                        .font( .system(size: 26))
                }
                
                Text(monthYearString(from: currentMonth))
                    .font(.headline)
                
                Button(action: { currentMonth = setMonth(increment: true )}) {
                    Image(systemName: "chevron.right")
                        .tint(.green)
                        .font( .system(size: 26))
                }
            }
            .padding()
            
            let daysOfMonth = generateDaysOfMonth(for: currentMonth)
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                ForEach(daysOfMonth, id: \.self) { date in
                    
                    let customize = isEventDay( from: date)
                    
                    Button{
                 
                        let newOptions = self.options.filter {
                            Calendar.current.isDate($0.date, inSameDayAs: date)
                        }
                        
                        if newOptions.count > 0 {
                            calendar.selectedRuns = newOptions
                            calendar.showSheet.toggle()
                        } else {
                            calendar.showAlert.toggle()
                        }
                        
                        
                    } label:  {
                        Text("\(Calendar.current.component(.day, from: date))")
                        
                            .frame(width: 40, height: 40)
                            .foregroundColor(customize || isDarkMode ? .white : .black)
                            .background(
                                Circle()
                                    .fill(customize  ? Color.green : Color.clear)
                            )
                            .clipShape(Circle())
                    }.disabled(!customize)
                }
            }
            .padding(.bottom, 20)
            .transition(transitionDirection())
            .animation(.spring, value: currentMonth)
            .gesture(
                DragGesture()
                    .onEnded { value in
                        if value.translation.width < 0 {
                            // Swipe para a esquerda: Próximo mês
                            withAnimation {
                                direction = -1
                                currentMonth = setMonth(increment: true )
                            }
                        } else if value.translation.width > 0 {
                            // Swipe para a direita: Mês anterior
                            withAnimation {
                                direction = 1
                                currentMonth =  setMonth(increment: false )
                            }
                        }
                    }
            )
            
        }
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.green.opacity(isDarkMode ? 0.1 : 0.18))
                .edgesIgnoringSafeArea(.all)
        )
        
        
    }
    
    func transitionDirection() -> AnyTransition {
        direction < 0 ? .move(edge: .trailing) : .move(edge: .leading)
    }
    
    func isEventDay (from date: Date) -> Bool {
        self.options.contains {
            Calendar.current.isDate(
                $0.date, inSameDayAs: date
            )
        }
    }
    
    // Funções auxiliares para navegação e exibição de meses
    func monthYearString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date).capitalized
    }
    
    func setMonth( increment: Bool) -> Date {
        Calendar.current.date(byAdding: .month, value: increment ? 1 : -1, to: currentMonth) ?? Date()
    }
    
    func generateDaysOfMonth(for month: Date) -> [Date] {
        guard let monthInterval = Calendar.current.dateInterval(of: .month, for: month) else { return [] }
        return Calendar.current.generateDates(
            inside: monthInterval,
            matching: DateComponents(hour: 0, minute: 0, second: 0)
        )
    }
}
