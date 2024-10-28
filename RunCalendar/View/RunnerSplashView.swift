//
//  RunnerSplashView.swift
//  RunCalendar
//
//  Created by Adelmo Artur de  Aquino on 27/10/24.
//

import SwiftUI

struct RunnerSplashView: View {
    @State private var isActive = false
    @Environment(\.colorScheme) var colorScheme
    
    var isDarkMode: Bool {
        colorScheme == .dark
    }
    
    var body: some View {
        if (isActive) {
            RunnerHomeView()
        } else {
            
            VStack() {
                Spacer()
                Text("Runner Calendar")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                
                Text("Encontre a sua proxima corrida")
                    .font(.title3)
                    .fontDesign(.rounded)
                    .foregroundColor(.secondary)
                
                ProgressView()
                    .padding()
                    .progressViewStyle(CircularProgressViewStyle())
                    .tint(isDarkMode ? .white : .black)
                
                
                Spacer()
                
                Image("runners")
                    .resizable()
                    .scaledToFit()
            }.onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    RunnerSplashView()
}
