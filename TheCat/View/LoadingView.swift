//
//  LoadingView.swift
//  TheCat
//
//  Created by Rendi Wijiatmoko on 12/01/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack{
            Text("😸")
                .font(.system(size: 40))
            ProgressView()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
