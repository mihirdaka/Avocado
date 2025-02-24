//
//  ImageView.swift
//  Avocado
//
//  Created by Mihir Daka on 2/17/25.
//

import SwiftUI

struct ImageView: View {
    
    @StateObject private var loader = CachedImageLoader()
    let url: URL?
    let placeHolder: Image
    
    var body: some View {
        Group {
                   if let image = loader.image {
                       Image(uiImage: image)
                           .resizable().clipShape(.rect(cornerRadius: 10)).scaledToFit()
                   } else {
                       placeHolder
                           .resizable()
                           .scaledToFit()
                   }
               }
               .onAppear {
                   if let url = url {
                       Task {
                           await loader.load(from: url)
                       }
                   }
               }
    }
}

#Preview {
    
}
