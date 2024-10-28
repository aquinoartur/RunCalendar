//
//  ContentView.swift
//  RunCalendar
//
//  Created by Adelmo Artur de  Aquino on 27/10/24.
//

import SwiftUI
import Foundation

struct RunnerHomeView: View {
    
    @State var store = RunOptionViewModel()
    @State private var calendar = CalendarEventsViewModel()
    
    


    var body: some View {
        NavigationStack {
            
            CustomRunnerCalendar(
                options: store.options,
                    calendar: calendar
            ).sheet(isPresented: $calendar.showSheet) {
                    RunDetailsView(
                        options: calendar.selectedRuns
                    ).presentationDragIndicator(.visible)
            }
            .alert("Aviso", isPresented: $calendar.showAlert) {
                Button("OK", role: .cancel){}
            } message: {
                Text("Nenhum evento encontrado para o dia selecionado")
            }
            
            List {
                Section("Todas as corridas"){
                    ForEach(store.options) { option in
                        RunOptionRow(option: option)     
                    }
                }
                
            }
            .padding(.top, 8)
            .onAppear { store.fetchOptions()}
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Próximas corridas")
                        .font(.headline)
                }
            }
            .listStyle(.plain)
        
        }
    }
}

#Preview {
    RunnerHomeView()
}


