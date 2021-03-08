//
//  Extensions.swift
//  LearnSpotify
//
//  Created by HieuTong on 3/6/21.
//

import Foundation
import UIKit

extension UIView {
    var width: CGFloat {
        return frame.size.width
    }
    
    var height: CGFloat {
        return frame.size.height
    }
    
    var left: CGFloat {
        return frame.origin.x
    }
    
    var right: CGFloat {
        return left + width
    }
    
    var top: CGFloat {
        return frame.origin.y
    }
    
    var bottom: CGFloat {
        return top + height
    }
}

extension UIViewController {
    func present(_ controller: UIViewController) {
        DispatchQueue.main.async {
            self.present(controller, animated: true)
        }
    }
    
    func push(_ controller: UIViewController) {
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func pop() {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func pop(_ controller: UIViewController) {
        DispatchQueue.main.async {
            self.navigationController?.popToViewController(controller, animated: true)
        }
    }
    
    func popToRoot() {
        DispatchQueue.main.async {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
