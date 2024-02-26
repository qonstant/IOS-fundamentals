//
//  ContentView.swift
//  Stanford_memorize
//
//  Created by Rakymzhan Zhabagin on 22.02.2024.
//

import SwiftUI

struct ContentView: View {
//    var body: some View {
//        return RoundedRectangle(cornerRadius: 20.0)
//            .stroke(lineWidth: 3)
//            .padding(.horizontal)
//            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
//    }
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20.0)
                    .stroke(lineWidth: 3)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                
                Text("Sup Nigga")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.red)
            }
            ZStack {
                RoundedRectangle(cornerRadius: 20.0)
                    .stroke(lineWidth: 3)
                    .foregroundColor(.blue)
                
                Text("Sup Nigga")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.red)
            }
            ZStack {
                RoundedRectangle(cornerRadius: 20.0)
                    .stroke(lineWidth: 3)
                    .foregroundColor(.blue)
                
                Text("Sup Nigga")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.red)
            }
            ZStack {
                RoundedRectangle(cornerRadius: 20.0)
                    .stroke(lineWidth: 3)
                    .foregroundColor(.blue)
                
                Text("Sup Nigga")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.red)
            }
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct CardView: View {
    var body: some View {
        return ZStack {
            RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 3)
            Text("How is it going Nigga?")
        }
    }
}

#Preview {
    ContentView()
}
