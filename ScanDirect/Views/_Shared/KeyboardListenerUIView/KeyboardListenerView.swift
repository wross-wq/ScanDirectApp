//
//  KeyboardListenerView.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/24/23.
//

import Foundation
import UIKit
import SwiftUI
import Combine

protocol KeyboardListenerDelegate {
    func onSubmit(_ input: String) -> Void
}

class KeyboardListenerUIView: UIViewController {
    let numbers = (0...9).map({ "\($0)" })
    var input = ""
    private let searchSubject = CurrentValueSubject<String?, Never>(nil)
    private var searchCancellable: AnyCancellable?

    var delegate: KeyboardListenerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchCancellable = searchSubject
            .removeDuplicates()
            .debounce(for: 1, scheduler: RunLoop.main)
            .sink { result in
                self.delegate?.onSubmit(self.input)
                self.input = ""
            }
    }
    
    
    
    override var keyCommands: [UIKeyCommand]? {
        return [
            UIKeyCommand(input: "\r", modifierFlags: [], action: #selector(enterPressed)),
            UIKeyCommand(input: UIKeyCommand.inputEscape, modifierFlags: [], action: #selector(escapePressed)),
        ]
    }

    @objc func enterPressed() {
        print("Enter pressed")
        
        delegate?.onSubmit(input)
        
        input = ""
    }
    
    @objc func escapePressed() {
        input = ""
    }
    
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {

        var didHandleEvent = false
        for press in presses {
            guard let key = press.key else { continue }
            if numbers.contains(key.characters) {
                didHandleEvent = true
                input.append(key.characters)
                self.searchSubject.send(input)
            }
        }

        if didHandleEvent == false {
            // Didn't handle this key press, so pass the event to the next responder.
            super.pressesBegan(presses, with: event)
        }
    }
}

struct KeyboardListenerView: UIViewControllerRepresentable {
    
    var onSubmit: (String) -> Void
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> KeyboardListenerUIView {
        let controller = KeyboardListenerUIView()
        controller.delegate = context.coordinator
        controller.becomeFirstResponder()
        
        print("makeUIViewController")
        return controller
    }

    func updateUIViewController(_ uiViewController: KeyboardListenerUIView, context: Context) {
        print(uiViewController.isFirstResponder)
        
        print("updateUIViewController", uiViewController.isFirstResponder)
        
    }
    
    class Coordinator: KeyboardListenerDelegate {
        let parent: KeyboardListenerView
        
        init(_ parent: KeyboardListenerView) {
            self.parent = parent
        }
        
        func onSubmit(_ input: String) {
            print("Coordinator ->", input)
            let ggcId: String
            if input.count > 9 {
                ggcId = String(input.suffix(9))
            } else {
                ggcId = input
            }
            
            if ggcId.count != 9 {
                return
            }
            
            parent.onSubmit(ggcId)
        }
    }
}
