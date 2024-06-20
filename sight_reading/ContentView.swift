//
//  ContentView.swift
//  sight_reading
//
//  Created by Sunny Kong on 2024-02-19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Learn To Sight Read")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    

                NavigationLink(destination: notes()) {
                    Text("Note Recognition")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 3, x: 1, y: 1)
                        .padding(.horizontal, 20)
                }.padding(.bottom,60)

                NavigationLink(destination: keySigs()) {
                    Text("Key Signature Recognition")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 3, x: 1, y: 1)
                        .padding(.horizontal, 20)
                }


            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
