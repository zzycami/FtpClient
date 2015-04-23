//
//  FTPLoginViewController.swift
//  FtpClient
//
//  Created by damingdan on 15/4/23.
//  Copyright (c) 2015年 ZhouZeyong. All rights reserved.
//

import UIKit
import Snap

class FTPLoginViewController: BaseViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var protocolTypeImageView: UIImageView!
    
    @IBOutlet weak var loginContainerView: UIView!
    
    var serverTextField: UITextField = UITextField(frame: CGRectZero)
    var usernameTextField: UITextField = UITextField(frame: CGRectZero)
    var passwordTextField: UITextField = UITextField(frame: CGRectZero)
    var initialPathTextField: UITextField = UITextField(frame: CGRectZero)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindKeyboardNotification()

        loginContainerView.layer.cornerRadius = 5
        loginContainerView.clipsToBounds = true
        
        var views:[UIView] = []
        var defaultFont = UIFont.systemFontOfSize(14)
        
        // Server
        serverTextField.placeholder = "Server"
        serverTextField.font = defaultFont
        var serverSection = SettingSectionView(frame: CGRectZero)
        serverSection.titleLabel.text = "Server"
        serverSection.contentView = serverTextField
        views.append(serverSection)
        loginContainerView.addSubview(serverSection)
        
        // User Name
        usernameTextField.placeholder = "User Name"
        usernameTextField.font = defaultFont
        var usernameSection = SettingSectionView(frame: CGRectZero)
        usernameSection.titleLabel.text = "User Name"
        usernameSection.contentView = usernameTextField
        views.append(usernameSection)
        loginContainerView.addSubview(usernameSection)
        
        // Password
        passwordTextField.placeholder = "Password"
        passwordTextField.font = defaultFont
        var passwordSection = SettingSectionView(frame: CGRectZero)
        passwordSection.titleLabel.text = "Password"
        passwordSection.contentView = passwordTextField
        views.append(passwordSection)
        loginContainerView.addSubview(passwordSection)
        
        // Initial Path
        initialPathTextField.placeholder = "Initial Path"
        initialPathTextField.font = defaultFont
        var initialPathSection = SettingSectionView(frame: CGRectZero)
        initialPathSection.titleLabel.text = "Initial Path"
        initialPathSection.contentView = initialPathTextField
        views.append(initialPathSection)
        loginContainerView.addSubview(initialPathSection)
        
        // Add constraints
        var prevView:UIView?
        for view in views {
            view.snp_makeConstraints({ (make) -> Void in
                make.left.equalTo(self.loginContainerView)
                make.right.equalTo(self.loginContainerView)
                if let pView = prevView {
                    make.top.equalTo(pView.snp_bottom)
                }else {
                    make.top.equalTo(self.loginContainerView)
                }
                make.height.equalTo(50)
            })
            prevView = view
        }
        
        // Tap 
        var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "keyboardHide:")
        tapGestureRecognizer.cancelsTouchesInView = false
        tapGestureRecognizer.delegate = self
        self.view.userInteractionEnabled = true
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func keyboardHide(sender:UIGestureRecognizer) {
        UIApplication.sharedApplication().keyWindow?.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addFavorite(sender: AnyObject) {
    }

}
