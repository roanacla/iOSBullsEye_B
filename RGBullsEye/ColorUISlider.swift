//
//  ColorUISlider.swift
//  RGBullsEye
//
//  Created by Roger Navarro on 5/27/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct ColorUISlider: UIViewRepresentable {
  
  var color: UIColor
  @Binding var value: Double

  func makeCoordinator() -> ColorUISlider.Coordinator {
    Coordinator(value: $value)
  }
  
  func makeUIView(context: Context) -> UISlider {
    let slider = UISlider(frame: .zero)
    slider.thumbTintColor = color
    slider.value = Float(value)
    
    slider.addTarget(context.coordinator,
                     action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
    return slider
  }

  func updateUIView(_ uiView: UISlider, context: Context) {
    uiView.value = Float(self.value)
  }
  
  class Coordinator: NSObject {
    // 1
    var value: Binding<Double>
    // 2
    init(value: Binding<Double>) {
      self.value = value
    }
    // 3
    @objc func valueChanged(_ sender: UISlider) {
      self.value.wrappedValue = Double(sender.value)
    }
  }

}

struct ColorUISlider_Previews: PreviewProvider {
    static var previews: some View {
      ColorUISlider(color: .red, value: .constant(0.5))
    }
}
