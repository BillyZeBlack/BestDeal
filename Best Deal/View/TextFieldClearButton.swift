//
//  TextFieldClearButton.swift
//  Best Deal
//
//  Created by williams saadi on 13/07/2022.
//

import SwiftUI

struct TextFieldClearButton: ViewModifier {
    @Binding var text: String
    
        func body(content: Content) -> some View {
            HStack {
                content
                if !text.isEmpty {
                    Button(
                        action: { self.text = "" },
                        label: {
                            Image(systemName: "xmark.circle")
                                .foregroundColor(Color(UIColor.opaqueSeparator))
                        }
                    )
                }
            }
        }
}
