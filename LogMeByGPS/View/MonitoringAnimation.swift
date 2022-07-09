//
//  MonitoringAnimation.swift
//  LogMeByGPS
//
//  Created by MacMini on 09/07/22.
//

import SwiftUI

struct MonitoringAnimation: View {
    @State var animate = false
    var foregroundColor = Color.blue
    var size = 100.0
    
    var body: some View {
        ZStack{
            Circle()
                //.fill(foregroundColor.opacity(0.25))
                .stroke(foregroundColor.opacity(0.40), lineWidth: 6)
                .frame(width: size/2, height: size/2)
                .scaleEffect(animate ? 1 : 0)
            
            Circle()
                //.fill(foregroundColor.opacity(0.25))
                .stroke(foregroundColor.opacity(0.25), lineWidth: 4)
                .frame(width: size, height: size)
                .scaleEffect(animate ? 1 : 0)
            
                
        }.onAppear{
            self.animate.toggle()
        }.animation(.linear(duration: 1.5).repeatForever(autoreverses: false), value: animate)
    }
}

struct MonitoringAnimation_Previews: PreviewProvider {
    static var previews: some View {
        MonitoringAnimation()
    }
}
