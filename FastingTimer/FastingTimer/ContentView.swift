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
                //MARK; Lets get started
                Text("Lets get started")
                    .font(.headline)
                    .foregroundColor(.blue)
                
                
                //MARK: Fasting Plan
                
                Text("16:8")
                    .fontWeight(.bold)
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
                
                HStack(spacing:60){
                    //MARK: Start Time
                    VStack(spacing:5){
                        Text("Start")
                            .opacity(0.7)
                        
                        Text(Date(),format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                    }
                    
                    //MARK: Start Time
                    VStack(spacing:5){
                        Text("End")
                            .opacity(0.7)
                        
                        Text(Date().addingTimeInterval(16),format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                    }
                }
                Button{
                    
                    
                }label:{
                    Text("Start Fasting")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal,24)
                        .padding(.vertical,8)
                        .background(.thinMaterial)
                        .cornerRadius(20)
                }
               
            }
            .foregroundColor(.white)
        }    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
