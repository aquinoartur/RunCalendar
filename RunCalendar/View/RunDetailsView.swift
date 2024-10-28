//
//  RunDetails.swift
//  RunCalendar
//
//  Created by Adelmo Artur de  Aquino on 27/10/24.
//

import SwiftUI

struct RunDetailsView: View {
    
    let options: [RunOption]
    
    
    
    var body: some View {
        VStack{
            ForEach(options) { option in
                Text(option.name)
             }
        }
    }
}

#Preview {
    RunDetailsView(options: [runOptionMock])
}
