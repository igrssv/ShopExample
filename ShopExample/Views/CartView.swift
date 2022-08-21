//
//  CartView.swift
//  ShopExample
//
//  Created by Игорь Сысоев on 21.08.2022.
//

import SwiftUI

struct CartView: View {
    @StateObject var vm = CartViewModel()
    @State var selectedTab = "Profile"
    @State var isShow = false
    @Binding var show: Bool
    var body: some View {
        if vm.products.isEmpty {
            ZStack(alignment: .bottom) {
                ZStack(alignment: .top) {
                    VStack {
                        ScrollView {
                            //MARK: - titel page
                            HStack {
                                Text("Cart")
                                    .font(.largeTitle)
                                    .bold()
                                Spacer()
                            }
                            .padding(.horizontal)
                            VStack {
                                ForEach(vm.products, id:\.id) { item in
                                    CartItemView(vm: CartItemViewModel(image: item.image, titel: item.title, price: item.price))
                                }
                            }
                            AddressView(vm: vm)
                        }
                        
                    }
                    //MARK: - close button
                    HStack {
                        Spacer()
                        Image(systemName: "xmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.black)
                            .frame(height: 10)
                            .padding(10)
                            .background(Color("ToolBarButton"))
                            .clipShape(Circle())
                            .onTapGesture {
                                show.toggle()
                            }
                        
                    }
                    .padding(.trailing)
                    .padding(.top, 5)
                    Spacer(minLength: 70)
                }
                //MARK: - pay orders
                HStack {
                    Text("Pay orders")
                    Spacer()
                    Text(String(vm.finalPrice) + " $")
                }
                .padding()
                .foregroundColor(.white)
                .frame(height: 58)
                .frame(maxWidth: .infinity)
                .background(Color("buttonColor"))
                .cornerRadius(20)
                .padding()
                .padding(.bottom, 10)
            }
        } else {
            VStack {
                Text("You cart is empty!")
                Text("Go shopping")
                    .foregroundColor(.white)
                    .frame(height: 58)
                    .frame(maxWidth: .infinity)
                    .background(Color("buttonColor"))
                    .cornerRadius(20)
                    .padding()
                    .padding(.bottom, 10)
                    .onTapGesture {
                        show.toggle()
                    }
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(show: .constant(true))
            .preferredColorScheme(.light)
    }
}


