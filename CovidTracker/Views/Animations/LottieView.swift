//
//  LottieView.swift
//  CovidTracker
//
//  Created by Siddharth sen on 4/12/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable{
    typealias UIViewType = UIView
    var fileName:String
    
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        //Normal Swift to render
        let view = UIView(frame: .zero)
        let animationView = AnimationView()
        //file name
        let animation = Animation.named(fileName)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        
        
        //constrains for SwiftUI
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        
    }
    
    
    
    
}

