//
//  DeliveryFullView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 05.08.2022.
//

import SwiftUI

struct DeliveryFullView: View {
    @StateObject var vm: DeliveryViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                ForEach(vm.delivery, id:\.id) { item in
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Date:")
                            Text("\(item.date.formatted())")
                        }
                        .font(.title3)
                        HStack {
                            Text("Product:")
                            Text("\(item.products.count)")
                        }
                        .padding(.top, 10)
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(item.products, id:\.id) { product in
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(Color("BGImage"))
                                        .overlay(content: {
                                            RoundedRectangle(cornerRadius: 10)
                                            .stroke()})
                                        .overlay {
                                            ImageView(vm: ImageViewModel(imageURL: product.image))
                                                .aspectRatio(contentMode: .fit)
                                            .frame(width: 90)}
                                }
                            }
                        }
                        .padding(.horizontal, 10)
                        Text("Addres:")
                            .font(.title)
                        Text(item.address.city)
                        HStack {
                            Text(item.address.addres)
                            Text(item.address.home)
                        }
                        Divider()
                        Text("Status")
                            .bold()
                        Text(item.status.rawValue)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(.blue)
                            .cornerRadius(20)
                    }
                    .padding()
                    .background(Color("BGDeliveryCard"))
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .padding()
                }
                .onDelete(perform: { index in
                    vm.del(index: index)
                })
                .padding(.top)
            }
        }
    }
}

struct DeliveryFullView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryFullView(vm: DeliveryViewModel())
        
    }
}
