//
//  ProgressRing.swift
//  FastingTimer
//
//  Created by David Buckley on 09/06/2022.
//

import SwiftUI

struct ProgressRing: View {
    @EnvironmentObject var fastingManager :FastingManager
    @State var progress = 0.0
    
    let timer=Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    let colors: [Color] = [.yellow, .red,.blue, .purple]

    var body: some View {
        ZStack{
            // MARK:Place Holder Ring
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.gray)
                .opacity(0.1)
            
            // MARK: Colored Ring
            Circle()
                .trim(from: 0.0, to: min(progress,1.0))
                .stroke(  AngularGradient(gradient: Gradient(colors: colors), center: .center,startAngle: .degrees(0), endAngle: .degrees(360 + 45)) ,style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                .rotationEffect((Angle(degrees: 270)))
                .animation(.easeInOut(duration: 1.0),value:progress)
            
                           
            VStack(spacing:30)
            {
                //MARK : Elapsed Time
                
                VStack(spacing:5)
                {
                    Text("Elapsed Time")
                        .opacity(0.7)
                    
                    Text(fastingManager.startTime,style: .timer)
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.top)
                
                //MARK :Remiaing Time
                
                VStack(spacing:5)
                {
                    if  !fastingManager.elapsed{
                        Text("Remaining Time")
                            .opacity(0.7)
                        
                    }else
                    {
                        Text("Extra Time")
                            .opacity(0.7)
                        
                    }
                 
                    Text(fastingManager.endTime,style: .timer)
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }
        }
        .frame(width: 250, height: 250)
        .padding()
        
        .onAppear{
            progress=1
        }
    
        .onReceive(timer)  { _ in
            fastingManager.track()
            
        }
                        }
                        }
                        
            struct ProgressRing_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRing()
            .environmentObject(FastingManager())
    }
}
