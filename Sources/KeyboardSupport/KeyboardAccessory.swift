//
//  KeyboardAccessory.swift
//  KeyboardSupport
//
//  Created by Earl Gaspard on 12/19/17.
//  Copyright © 2017 Bottle Rocket Studios. All rights reserved.
//

import UIKit

@available(*, deprecated: 2.0, renamed: "KeyboardAccessoryDelegate")
public typealias KeyboardInputAccessoryDelegate = KeyboardAccessoryDelegate

/// Contains callbacks for keyboard accessory navigation options.
public protocol KeyboardAccessoryDelegate: class {
    func keyboardAccessoryDidTapBack(_ accessory: UIView)
    func keyboardAccessoryDidTapNext(_ accessory: UIView)
    func keyboardAccessoryDidTapDone(_ accessory: UIView)
}

public extension KeyboardAccessoryDelegate {
    func keyboardAccessoryDidTapBack(_ accessory: UIView) {}
    func keyboardAccessoryDidTapNext(_ accessory: UIView) {}
    func keyboardAccessoryDidTapDone(_ accessory: UIView) {}
}

@available(*, deprecated: 2.0, renamed: "KeyboardAccessory")
public typealias KeyboardInputAccessory = KeyboardAccessory

/// Represents something that has keyboard accessory navigation options.
public protocol KeyboardAccessory: class {
    var nextButton: UIBarButtonItem? { get set }
    var backButton: UIBarButtonItem? { get set }
    var doneButton: UIBarButtonItem? { get set }
    
    var keyboardAccessoryDelegate: KeyboardAccessoryDelegate? { get set }
}
