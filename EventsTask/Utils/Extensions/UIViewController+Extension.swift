//
//  UIViewController+Extension.swift
//  EventsTask
//
//  Created by Ajay Sangani on 24/05/22.
//

import UIKit

extension UIViewController {
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    func showAlert(_ message:String, buttons:[String], completion:((_ tappedIndex: Int) -> Void)!) -> Void {
        
        let alertController = UIAlertController(title: Bundle.appName(), message: message, preferredStyle: .alert)
        alertController.setValue(NSAttributedString(string: Bundle.appName(), attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16.0), NSAttributedString.Key.foregroundColor : UIColor.black]), forKey: "attributedTitle")
        
        alertController.setValue(NSAttributedString(string: message, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14.0), NSAttributedString.Key.foregroundColor : UIColor.darkGray]), forKey: "attributedMessage")
        
        for index in 0..<buttons.count {
            let action = UIAlertAction(title: buttons[index], style: .default, handler: {
                (alert: UIAlertAction!) in
                if(completion != nil){
                    completion(index)
                }
            })
            action.setValue(UIColor.black, forKey: "titleTextColor")
            alertController.addAction(action)
        }
        //UIApplication.shared.delegate!.window!?.rootViewController!.present(alertController, animated: true, completion:nil)
        self.present(alertController, animated: true, completion: nil)
    }
    
    public func showAlert(title: String?, message: String?, preferredStyle: UIAlertController.Style, alertActions: [UIAlertAction]) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        for alertAction in alertActions {
            alertController.addAction(alertAction)
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
}
