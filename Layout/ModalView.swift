//
//  ModalView.swift
//  Layout
//
//  Created by Arthur on 07/04/2020.
//  Copyright © 2020 Arthur Monnet. All rights reserved.
//

import SwiftUI

struct ModalView: View {
    var body: some View {
        
        HStack(spacing: 0) {
            Product()
            Product()
            Product()
            Product()
        }
        
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}

struct Product: View {
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Spacer()
                Text("Poulet ")
                    .font(.system(size: 17, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .offset(y: 8)
                    .foregroundColor(.white)
                Spacer()
                Text("6,00 €")
                    .font(.system(size: 15, weight: .regular))
                    .offset(y: -8)
                    .foregroundColor(.white)

            }
            .frame(height: 116)
            .frame(width: screen.width / 2)
            .background(Color("Primary"))
        }
    }
}

let screen = UIScreen.main.bounds


