//
//  CommonCustomClass.swift
//  Test Assignment
//
//  Created by Jenish's MacBook on 02/05/24.
//

import Foundation
import UIKit

//MARK: - View Corner Radius And Shaddow
func View_Corner_Radius_And_Shaddow(view:UIView,CornerRadius:Int){
    
        view.layer.cornerRadius = CGFloat(CornerRadius)
    
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.3

}

//MARK: - Custom Activity IndicatorView
class CustomActivityIndicatorView: UIActivityIndicatorView {
    
    override init(style: UIActivityIndicatorView.Style) {
        super.init(style: style)
        setup()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        // Customize your activity indicator here
        self.color = .blue
        self.hidesWhenStopped = true
    }
    
    func startAnimating(in view: UIView) {
        // Add the activity indicator to the given view and start animating
        view.addSubview(self)
        self.center = view.center
        self.startAnimating()
    }
    
    func stopAnimatingAndRemoveFromSuperview() {
        // Stop animating and remove the activity indicator from its superview
        self.stopAnimating()
        self.removeFromSuperview()
    }
}

