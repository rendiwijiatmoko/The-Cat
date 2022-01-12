//
//  BreedRow.swift
//  TheCat
//
//  Created by Rendi Wijiatmoko on 12/01/22.
//

import SwiftUI

struct BreedRow: View {
    let breed: Breed
    let imageSize: CGFloat = 100
    var body: some View {
        HStack {
            
            if breed.image != nil {
                AsyncImage(url: URL(string: breed.image!.url!)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipped()
                    } else if phase.error != nil {
                        Color.red
                            .frame(width: imageSize, height: imageSize)
                    } else {
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)
                    }
                }
            } else {
                Color.gray.frame(width: imageSize, height: imageSize)
            }
            
            VStack(alignment: .leading, spacing: 5){
                Text(breed.name)
                    .font(.headline)
                Text(breed.description)
            }
        }
    }
}

struct BreedRow_Previews: PreviewProvider {
    static var previews: some View {
        BreedRow(breed: Breed.example1())
            .previewLayout(.fixed(width: 300, height: 200))
    }
}
