//
//  DeliveryView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 04.08.2022.
//

import SwiftUI

struct DeliveryView: View {
    @StateObject var vm = DeliveryViewModel()
    
    var body: some View {
        VStack {
            VStack {
                Text("Delivery")
                    .font(.largeTitle)
                    .bold()
                    .padding()
            }
            .frame(maxWidth: .infinity, alignment:  .leading)
            
            
        if !vm.delivery.isEmpty {
            DeliveryFullView(vm: vm)
        } else {
            VStack {
                Spacer()
                Text("No delivery")
                    .font(.largeTitle)
                Spacer()
            }
        }
    }
    }
}

struct DeliveryView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryView()
    }
}





