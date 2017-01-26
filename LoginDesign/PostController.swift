//
//  PostController.swift
//  LoginDesign
//
//  Created by Orange Apps on 20/01/2017.
//  Copyright © 2017 Orange Apps. All rights reserved.
//

import UIKit

class PostController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var txtPost: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Placeholder for post text field.
        txtPost.text = "What's on your mind?"
        txtPost.textColor = UIColor.lightGray
        txtPost.delegate = self
        txtPost.font = UIFont.systemFont(ofSize: 25)
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if txtPost.textColor == UIColor.lightGray {
            txtPost.text = nil
            txtPost.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if txtPost.text.isEmpty {
            txtPost.text = "What's on your mind?"
            txtPost.textColor = UIColor.lightGray
            
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print(txtPost.text.characters.count)
        if txtPost.text.characters.count >= 50 {
            txtPost.font = UIFont.systemFont(ofSize: 20)
        }
        
        if txtPost.text.characters.count >= 100 {
            txtPost.font = UIFont.systemFont(ofSize: 15)
        }
    }
    
}
