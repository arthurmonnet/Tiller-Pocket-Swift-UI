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
                    .frame(width: 42, height: 44)
                    .foregroundColor(.black)
                
                Spacer()
                    
                Text("Commandes")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                
                Spacer()
                    
                Button(action: {self.newOrder.toggle()})
                    {
                        Image(systemName: "plus.circle.fill")                .font(.system(size: 24, weight: .medium))
                        .frame(width: 42, height: 44)
                        .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                    }
                    .sheet(isPresented: $newOrder) {
                        ModalView()
                    }
                    
   
                
            }
            .padding(.horizontal, 8.0)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    OrderType(name: "Ouvertes", color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
                    OrderType(name: "À Encaisser", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
                    OrderType(name: "Réservées", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))

                }
                .padding(.horizontal)
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    Text("Ouvertes")
                        .font(.subheadline).fontWeight(.semibold)
                        .foregroundColor(.black)
                    Spacer()
                    Text("4")
                        .font(.subheadline).fontWeight(.semibold)
                    .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                        
                }
                .padding(.horizontal)
                
                OrderItem(tableID: 12, amount: 2, people: 2, color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
                OrderItem(tableID: 12, amount: 2, people: 2, color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
                OrderItem(tableID: 12, amount: 2, people: 2, color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))

                
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


struct OrderType: View {
    var name: String
    var color: UIColor
    var body: some View {
        Text(name)
            .font(.system(size: 15, weight: .semibold))
            .multilineTextAlignment(.center)
            .padding(5.0)
            .padding(.horizontal, 12)
            .background(Color(color))
            .cornerRadius(20)
            .foregroundColor(Color.white)
    }
}

struct OrderItem: View {
    var tableID: Int
    var amount: CGFloat
    var people: Int
    var color: UIColor
    var body: some View {
        HStack {
            HStack() {
                
                Text("\(tableID)")
                    .font(.system(size: 20, weight: .semibold))
                    .frame(width: 36, height: 36)
                    .background(Color(color))
                    .cornerRadius(4)
                    .foregroundColor(Color.white)
                
                VStack(alignment: .leading) {
                    Text("\(Int(amount)) €")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.black)
                    Text("\(people) Couverts")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(Color(color))
                }
                Spacer()
                
                Image(systemName: "arrow.right.circle.fill")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(Color(color))
            }
                
            .padding()
            .background(Color(color).opacity(0.2))
            .cornerRadius(8)
        }
        .padding(.horizontal)
    }
}
