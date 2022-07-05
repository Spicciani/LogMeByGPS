//
//  ContentView.swift
//  LogMeIn
//
//  Created by Marco Spicciani on 05/07/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gps = GpsManager()
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.blue)
                .shadow(color: .black, radius: 5, x: 1, y: 1)
                .padding(30)
                .overlay {
                    VStack{
                        Text("Log Me In")
                            .foregroundColor(.white)
                            .bold()
                            .font(.largeTitle)
                        Button("Start Monitoring") {
                            startMonitoring()
                        }.buttonStyle(BubbleButton())
                        
                        if let location = gps.location{
                            
                            Text("""
                                 Current Position
                                 Coordinate
                                 \(location)
                                 """)
                                .foregroundColor(.white)
                                .bold()
                                .font(.footnote)
                                .frame(width: 200, height: nil)
                        }
                        
                    }
                }
        }
    }

    func startMonitoring(){
        gps.requestAuthorization()
        
        if gps.checkPermissionStatus(){
            gps.retriveCurrentUserPosition()
        }
        
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
