//
//  BreedDetailView.swift
//  TheCat
//
//  Created by Rendi Wijiatmoko on 12/01/22.
//

import SwiftUI

struct BreedDetailView: View {
    let breed: Breed
    let imageSize: CGFloat = 300
    var body: some View {
        ScrollView {
            VStack{
                if breed.image != nil {
                    AsyncImage(url: URL(string: breed.image!.url!)) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .scaledToFit()
                                .frame(height: imageSize)
                                .clipped()
                        } else if phase.error != nil {
                            Text(phase.error?.localizedDescription ?? "")
                                .foregroundColor(.pink)
                                .frame(width: imageSize, height: imageSize)
                        } else {
                            ProgressView()
                                .frame(width: imageSize, height: imageSize)
                        }
                    }
                } else {
                    Color.gray.frame(width: imageSize, height: imageSize)
                }
                
                VStack(alignment: .leading, spacing: 15){
                    
                    Text(breed.name)
                        .font(.headline)
                    Text(breed.temperament)
                        .font(.footnote)
                    Text(breed.explanation)
                    
                }.padding()
            }
        }
    }
}

struct BreedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BreedDetailView(breed: Breed.example1())
    }
}
