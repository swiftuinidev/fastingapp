//
//  ProgressRing.swift
//  FastingTimer
//
//  Created by David Buckley on 09/06/2022.
//

import SwiftUI

struct ProgressRing: View {
    @State var progress = 0.5
    let colors: [Color] = [.yellow, .red,.blue, .purple]

    var body: some View {
        ZStack{
            // Mark:Place Holder Ring
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.gray)
                .opacity(0.1)
            
            // Mark: Colored Ring
            Circle()
                .trim(from: 0.0, to: min(progress,1.0))
                .stroke(  AngularGradient(gradient: Gradient(colors: colors), center: .center,startAngle: .degrees(0), endAngle: .degrees(360 + 45)) ,style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                .rotationEffect((Angle(degrees: 270)))

        }
        .frame(width: 250, height: 250)
        .padding()
                        }
                        }
                        
            struct ProgressRing_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRing()
    }
}
