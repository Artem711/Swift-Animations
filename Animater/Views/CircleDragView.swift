//
//  CircleDragView.swift
//  Animater
//
//  Created by Артём Мошнин on 3/7/21.
//

import SwiftUI

struct CircleDragView: View {
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in self.offset = value.translation }
            .onEnded { _ in
                withAnimation {
                    self.offset = .zero
                    self.isDragging = false
                }
            }
            
        let tapGesture = LongPressGesture()
            .onEnded { (value) in
                withAnimation {
                    self.isDragging = true
                }
            }
        
        // DragGesture only starts after the TapGesture succeeded
        let combinedGesture = tapGesture.sequenced(before: dragGesture)
        
        return Circle()
            .fill(Color.red)
            .frame(width: 64, height: 64)
            .scaleEffect(self.isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combinedGesture)
    }
}

struct CircleDragView_Previews: PreviewProvider {
    static var previews: some View {
        CircleDragView()
    }
}
