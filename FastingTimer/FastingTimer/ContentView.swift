//
//  ContentView.swift
//  FastingTimer
//
//  Created by David Buckley on 09/06/2022.
//

import SwiftUI

struct ContentView: View {
    let date = Date()
    let dateFormatter = DateFormatter()
   @StateObject var fastingManager = FastingManager()
    
    var title:String{
        switch fastingManager.fastingState{
        case .notStarted:
            return "Lets get started"
        case .fasting:
           return "You are now fasting"
        case .feeding:
            return "You are now feeding"
        }
    }
    var body: some View {
        ZStack{
         Color(#colorLiteral(red: 0.06426735233, green: 0.007159079822, blue: 0.07578741644, alpha: 0.8470588235))
                .ignoresSafeArea()
            content
        }
            
        
    }
    
    var content : some View
    {
        
        ZStack {
            VStack(spacing:40){
                //MARK: Title
                Text(title)
                    .font(.headline)
                    .foregroundColor(.blue)
                
                
                //MARK: Fasting Plan
                
                Text(fastingManager.fastingPlan.rawValue)
                    .fontWeight(.semibold)
                    .padding(.horizontal,24)
                    .padding(.vertical,8)
                    .background(.thinMaterial)
                    .cornerRadius(20)
                
                Spacer()
               
            }
            .padding()
            VStack(spacing:40){
                
            //Mark: Progress Ring
                ProgressRing()
                    .environmentObject(fastingManager)
                HStack(spacing:60){
                    //MARK: Start Time
                    VStack(spacing:5){
                        Text(fastingManager.fastingState == .notStarted ?    "Start" : "Started")
                            .opacity(0.7)
                        
                        Text(fastingManager.startTime,format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                    }
                    
                    //MARK: Start Time
                    VStack(spacing:5){
                        Text(fastingManager.fastingState == .notStarted ?    "End" : "Ends")
                            .opacity(0.7)
                        
                        Text(fastingManager.endTime.addingTimeInterval(16),format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                    }
                }
                Button{
                    fastingManager.toggleFastingState()
                    
                }label:{
                    Text(fastingManager.fastingState == .fasting ? "End Fasting" : "Start Fasting")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.horizontal,24)
                        .padding(.vertical,8)
                        .background(.thinMaterial)
                        .cornerRadius(20)
                }
               
            }
            .padding()
        }
        .foregroundColor(.white)

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
