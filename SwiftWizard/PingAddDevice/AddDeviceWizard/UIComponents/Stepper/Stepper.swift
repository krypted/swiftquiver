//
//  Stepper.swift
//  PingAddDevice
//
//

import Foundation
import SwiftUI

struct Stepper<ContentLabel: View>: View {
    @Binding var value: Int
    @ViewBuilder private var label: (Int) -> ContentLabel
    var range: ClosedRange<Int>?

    @State fileprivate var textColor = Color.black
    
    init(
        value: Binding<Int> = .constant(0),
        range: ClosedRange<Int>? = nil,
        @ViewBuilder content: @escaping (Int) -> ContentLabel
    ) {
        self._value = value
        self.label = content
        self.range = range
    }
    
    var body: some View {
        HStack {
            Button() {
                decrement()
            } label: {
                Image(systemName: "minus.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.appBlue)
                    .frame(width: 20, height: 20)
            }.buttonStyle(PlainButtonStyle())
            label(value)
            Button() {
                increment()
            } label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.appBlue)
                    .frame(width: 20, height: 20)
            }.buttonStyle(PlainButtonStyle())
        }
    }
    
    private func increment() {
        if let range = range,
           !range.contains(value + 1) {
            return
        }
        value += 1
    }
    
    private func decrement() {
        if let range = range,
           !range.contains(value - 1) {
            return
        }
        value -= 1
    }
}

struct Stepper_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle().frame(width: 250, height: 100, alignment: .center)
            Stepper(range: 0...10) {
                Text("\($0) ").font(.system(size: 23, weight: .semibold))
                + Text("min").font(.system(size: 17.15, weight: .light))
            }
        }
    }
}


