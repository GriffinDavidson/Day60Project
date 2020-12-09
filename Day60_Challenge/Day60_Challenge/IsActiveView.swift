//
//  IsActiveView.swift
//  Day60_Challenge
//
//  Created by Griffin Davidson on 11/26/20.
//

import SwiftUI

struct IsActiveView: View {
    
    var isActive: Bool
    
    var body: some View {
        if isActive {
            Text("Active")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.all, 7)
                .background(Color.green)
                .clipShape(Capsule())
        } else {
            Text("Inactive")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.all, 7)
                .background(Color.red)
                .clipShape(Capsule())
        }
    }
}

struct IsActiveView_Previews: PreviewProvider {
    static var previews: some View {
        IsActiveView(isActive: true)
            .preferredColorScheme(.dark)
    }
}
