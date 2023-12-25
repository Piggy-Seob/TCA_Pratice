//
//  ContentView.swift
//  WhoLetTheDogsOut
//
//  Created by Gucci on 12/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var url = URL(string: "https://picsum.photos/200")
    @State private var id = UUID()
    
    var body: some View {
        VStack {
            AsyncImage(url: url) { asyncImagePhase in
                switch asyncImagePhase {
                case .empty:
                    Color(.white)
                        .frame(width: 300, height: 400)
                        .overlay {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .orange))
                                .scaleEffect(3)                            
                        }
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 300, height: 400, alignment: .center)
                case .failure(let error):
                    Text(error.localizedDescription)
                @unknown default:
                    Color(.black)
                        .overlay {
                            Text("Something gose wrong")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                        }
                }
            }
            .id(id)
            
            Spacer()
            
            Button {
                id = UUID()
            } label: {
                Text("이미지 불러오기")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
