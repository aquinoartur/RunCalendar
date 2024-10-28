//
//  RunOptionRow.swift
//  RunCalendar
//
//  Created by Adelmo Artur de  Aquino on 27/10/24.
//
import SwiftUI

struct RunOptionRow: View {
    
    var option: RunOption
    
    @State private var showSheetFromList: Bool = false
    
    var body: some View {
        HStack(alignment: .bottom) {
            Image(systemName: "figure.run")
                .foregroundStyle(.green)
            
            Text(option.name)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
        }
        .frame(height: 40)
        
        .onTapGesture {
            showSheetFromList.toggle()
        }
        .sheet(
            isPresented: $showSheetFromList
        ) {
            RunDetailsView(
                options: [option]
            )
            .presentationDragIndicator(.visible)
        }
    }
}

