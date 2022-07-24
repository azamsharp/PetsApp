//
//  CarouselView.swift
//  PetsApp
//
//  Created by Mohammad Azam on 7/23/22.
//

import SwiftUI

struct CarouselView: View {
    
    let uiModel: CarouselUIModel
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(uiModel.imageUrls, id: \.self) { imageUrl in
                    AsyncImage(url: imageUrl) { image in
                        image
                            .resizable()
                            .frame(width: 200, height: 200)
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(uiModel: CarouselUIModel(imageUrls: []))
    }
}
