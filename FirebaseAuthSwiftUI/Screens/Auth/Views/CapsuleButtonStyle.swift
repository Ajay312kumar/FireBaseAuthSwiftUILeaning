//
//  CapsuleButtonStyle.swift
//  FirebaseAuthSwiftUI
//
//  Created by Ajay Kumar on 11/12/24.
//

import Foundation
import SwiftUI


struct CapsuleButtonStyle: ButtonStyle{
    
    var bgColor: Color = .teal
    var textColor: Color = .white
    var hasBorder: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .fontWeight(.semibold)
        .foregroundStyle(textColor)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Capsule().fill(bgColor))
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
        .overlay{
            hasBorder ?
            Capsule()
                .stroke(.gray, lineWidth: 1)
            : nil
        }
    }
}

//MARK: Divider
struct LabelledDivider: View {

    let label: String
    let horizontalPadding: CGFloat
    let color: Color

    init(label: String, horizontalPadding: CGFloat = 0, color: Color = .gray) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }

    var body: some View {
        HStack {
            line
            Text(label).foregroundColor(color)
            line
        }
    }

    var line: some View {
        VStack { Divider().background(color) }.padding(horizontalPadding)
    }
}



