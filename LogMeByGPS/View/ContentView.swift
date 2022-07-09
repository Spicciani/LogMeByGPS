//
//  ContentView.swift
//  LogMeIn
//
//  Created by Marco Spicciani on 05/07/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gps = GpsManager()
    
    let style1 = LinearGradient(colors: [.blue,.blue,.indigo], startPoint: .top , endPoint: .bottom)
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.cyan.opacity(0.5),Color.purple.opacity(0.7)], startPoint: .topLeading , endPoint: .bottomTrailing)
            
            
            Circle()
                .frame(width: 300)
                .foregroundColor(Color.cyan.opacity(0.5))
                .blur(radius: 10)
                .offset(x: -100, y: -150)
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .frame(width: 300, height: 500)
                .foregroundStyle(LinearGradient(colors: [Color.purple.opacity(0.6),Color.mint.opacity(0.5)], startPoint: .top , endPoint: .leading))
                .offset(x: 200)
                .blur(radius: 30)
                .rotationEffect(.degrees(30))
            
            
            Circle()
                .frame(width: 450)
                .foregroundStyle(Color.pink.opacity(0.6))
                .blur(radius: 20)
                .offset(x: 200, y: -200)
            
                    VStack{
                        Text("Log Me In")
                            .font(.system(size: 40, weight: .bold, design: Font.Design.rounded))
                            
                        let label = gps.running ? "Stop" : "Start"
                        Button("\(label) Monitoring") {
                            startMonitoring()
                        }.buttonStyle(BubbleButton())
                        
                        
                        
                        if let _ = gps.location{
                            VStack{
                                Text("""
                                     Distance
                                     \(gps.currentDistance().formatted()) meter
                                     Iterations \(gps.iteration)
                                     """)
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.footnote)
                                    .frame(width: 200, height: nil)
                                if gps.running {
                                    MonitoringAnimation()
                                }
                                
                            }
                            
                        }
                        
                    }.padding()
                .frame(width: 360)
                .foregroundStyle(style1)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
            
                
        }.ignoresSafeArea()
    }

    func startMonitoring(){
        
        
        if gps.running {
            gps.stopUpdatingLocation()
        }else {
            gps.requestAuthorization()
            
            if gps.checkPermissionStatus(){
                gps.retriveCurrentUserPosition()
            }
        }
        
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
