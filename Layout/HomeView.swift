//
//  HomeView.swift
//  Tiller Pocket
//
//  Created by Arthur on 07/04/2020.
//  Copyright © 2020 Arthur Monnet. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var newOrder = false

    var body: some View {
        
        VStack(spacing: 8.0) {
            
            HStack(alignment: .center) {
                Image(systemName: "line.horizontal.3")
                .font(.system(size: 24, weight: .medium))
                    .frame(width: 44, height: 44)
                    .foregroundColor(Color("Main"))
                
                Spacer()
                    
                Text("Commandes")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("Main"))

                Spacer()
                    
                Button(action: {self.newOrder.toggle()})
                    {
                        Image(systemName: "plus.circle.fill")                .font(.system(size: 24, weight: .medium))
                        .frame(width: 44, height: 44)
                        .foregroundColor(Color("Primary"))
                    }
                    .sheet(isPresented: $newOrder) {
                        ModalView()
                    }
                
            }
            .padding(.horizontal, 8.0)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    OrderFilters(name: "Ouvertes", color: "Primary")
                    OrderFilters(name: "À Encaisser", color: "Secondary")
                    OrderFilters(name: "Réservées", color: "Tertiary")

                }
                .padding(.horizontal)
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    Text("Ouvertes")
                        .font(.subheadline).fontWeight(.semibold)
                        .foregroundColor(Color("Main"))
                    Spacer()
                    Text("4")
                        .font(.subheadline).fontWeight(.semibold)
                    .foregroundColor(Color("Primary"))
                        
                }
                .padding(.horizontal)
                ForEach(orderData) { item in
                    OrderItem(order: item)
                }
            }
            .padding(.top)

            Spacer()
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct OrderFilters: View {
    var name: String
    var color: String
    var body: some View {
        Text(name)
            .font(.subheadline).fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .padding(5.0)
            .padding(.horizontal, 12)
            .background(Color(color))
            .cornerRadius(20)
            .foregroundColor(Color.white)
    }
}

struct OrderItem: View {
    var order: Order
    
    var body: some View {
        HStack {
            HStack() {
                
                Text("\(order.tableID)")
                    .font(.headline)
                    .frame(width: 36, height: 36)
                    .background(Color(order.color))
                    .cornerRadius(4)
                    .foregroundColor(Color.white)

                VStack(alignment: .leading) {
                    Text("\(Int(order.amount)) €")
                        .font(.subheadline).fontWeight(.semibold)
                        .foregroundColor(Color("Main"))
                    Text("\(order.people) Couverts")
                        .font(.caption).fontWeight(.semibold)
                        .foregroundColor(Color(order.color))
                }
                Spacer()
                
                Image(systemName: "arrow.right.circle.fill")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(Color(order.color))
            }
                
            .padding()
            .background(Color(order.color).opacity(0.2))
            .cornerRadius(8)
        }
        .padding(.horizontal)
    }
}

struct Order:Identifiable {
    var id = UUID()
    var tableID: Int
    var amount: CGFloat
    var people: Int
    var color: String
}

let orderData = [
    Order(tableID: 1, amount: 12, people: 2, color: "Primary"),
    Order(tableID: 2, amount: 10, people: 2, color: "Primary"),
    Order(tableID: 3, amount: 15, people: 4, color: "Primary"),
]
