//
//  CommentsView.swift
//  iTour
//
//  Created by Eric de Quartel on 05/02/2024.
//

import SwiftUI
import HighlightedTextEditor

struct ShowAndEditTextView: View {
    @Binding var comments: String

    var body: some View {
        Form {
            HighlightedTextEditor(text: $comments, highlightRules: .markdown)
                .frame(height: 600)
        }
    }
}
#Preview {
    ShowAndEditTextView(comments: .constant("Example Comment"))
}
