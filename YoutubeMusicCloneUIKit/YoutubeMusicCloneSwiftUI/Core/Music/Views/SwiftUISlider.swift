//
//  SwiftUISlider.swift
//  YoutubeMusicCloneSwiftUI
//
//  Created by Baris OZGEN on 23.12.2022.
//

import SwiftUI
struct SwiftUISlider: UIViewRepresentable {
    
    final class Coordinator: NSObject {  var value: Binding<Double>
        var maxValue: Binding<Double>
        var thumColor: Binding<UIColor>
        init(value: Binding<Double>, maxValue: Binding<Double>, thumColor: Binding<UIColor>) {
            self.value = value
            self.maxValue = maxValue
            self.thumColor = thumColor
        }
        @objc func valueChanged(_ sender: UISlider) {
            self.value.wrappedValue = Double(sender.value)
        }
    }
    
    @Binding var thumbColor: UIColor
    var minTrackColor: UIColor?
    var maxTrackColor: UIColor?
    
    @Binding var value: Double
    @Binding var maxValue: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.thumbTintColor = thumbColor
        slider.minimumTrackTintColor = minTrackColor
        slider.maximumTrackTintColor = maxTrackColor
        slider.value = Float(value)
        slider.maximumValue = Float(maxValue)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged(_:)),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(self.value)
    }
    
    func makeCoordinator() -> SwiftUISlider.Coordinator {
        Coordinator(value: $value, maxValue: $maxValue, thumColor: $thumbColor)
    }
}

#if DEBUG
struct SwiftUISlider_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUISlider(
            thumbColor: .constant(.white),
            minTrackColor: .blue,
            maxTrackColor: .green,
            value: .constant(0.5), maxValue: .constant(129.07)
        )
    }
}
#endif
