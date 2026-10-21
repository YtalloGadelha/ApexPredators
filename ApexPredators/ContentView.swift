//
//  ContentView.swift
//  ApexPredators
//
//  Created by Ytallo Gadelha on 20/10/26.
//

import SwiftUI

struct ContentView: View {
    
    let predators = Predators()
    
    var body: some View {
        
        List(predators.apexPredators){ predator in
            
            HStack {
                
                // Dinosaur image
                Image(predator.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .shadow(color:.white, radius: 1)
                
                VStack(alignment: .leading) {
                    // Name
                    Text(predator.name)
                        .fontWeight(.bold)
                    
                    // Type
                    Text(predator.type.rawValue.capitalized)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding(.horizontal, 13)
                        .padding(.vertical, 5)
                        .background(predator.type.background)
                        .clipShape(.capsule)
                }
                
            }
            
        }.preferredColorScheme(.dark)
        
    }
}

#Preview {
    ContentView()
}
