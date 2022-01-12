//
//  BreedListView.swift
//  TheCat
//
//  Created by Rendi Wijiatmoko on 12/01/22.
//

import SwiftUI

struct BreedListView: View {
    let breeds: [Breed]
    var body: some View {
        NavigationView {
            List{
                ForEach(breeds){ breed in
                    BreedRow(breed: breed)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Find Your Perfect Cat")
        }
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView(breeds: BreedFetcher.succssesState().breeds)
    }
}
