//
//  SingleFieldAutoNavViewController.swift
//  KeyboardSupport
//
//  Created by John Davis on 12/18/18.
//  Copyright © 2018 Bottle Rocket. All rights reserved.
//

import UIKit
import KeyboardSupport

class SingleFieldAutoNavViewController: UIViewController, KeyboardRespondable {

    // IBOutlets
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private(set) var textField1: UITextField!

    // KeyboardScrollable
    var keyboardScrollableScrollView: UIScrollView?
    var keyboardWillShowObserver: NSObjectProtocol?
    var keyboardWillHideObserver: NSObjectProtocol?
    
    // KeyboardNavigator
    private(set) var keyboardNavigator: KeyboardAutoNavigator?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // KeyboardDismissable setup
        setupKeyboardDismissalView()
        
        // KeyboardScrollable setup
        keyboardScrollableScrollView = scrollView
        setupKeyboardObservers()
        
        // KeyboardToolbar setup
        let keyboardToolbar = KeyboardToolbar(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 44.0))
        keyboardToolbar.addButton(type: .back, title: "Back")
        keyboardToolbar.addButton(type: .next, title: "Next")
        keyboardToolbar.addFlexibleSpace()
        keyboardToolbar.addSystemDoneButton()
        
        // KeyboardNavigator setup
        keyboardNavigator = KeyboardAutoNavigator(navigationContainer: scrollView, defaultToolbar: keyboardToolbar, returnKeyNavigationEnabled: true)
        keyboardNavigator?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardObservers()
    }
}

// MARK: - KeyboardNavigatorDelegate

extension SingleFieldAutoNavViewController: KeyboardAutoNavigatorDelegate {
    
    func keyboardNavigatorDidTapBack(_ navigator: KeyboardAutoNavigator) {
        print("keyboardAutoNavigatorDidTapBack")
    }
    
    func keyboardNavigatorDidTapNext(_ navigator: KeyboardAutoNavigator) {
        print("keyboardAutoNavigatorDidTapNext")
    }
    
    func keyboardNavigatorDidTapDone(_ navigator: KeyboardAutoNavigator) {
        print("keyboardAutoNavigatorDidTapDone")
    }
}
