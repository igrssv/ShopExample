//
//  ImageView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 30.07.2022.
//

import SwiftUI

struct ImageView: View {
    @StateObject var vm: ImageViewModel
    var body: some View {
        ZStack {
            Image(uiImage: vm.image!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .blur(radius: vm.isLoad ? 1 : 0)
            if vm.isLoad == true {
                ProgressView()
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(vm: ImageViewModel(imageURL: ""))
    }
}
