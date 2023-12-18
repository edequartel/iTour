////
////  what3words.swift
////  iTour
////
////  Created by Eric de Quartel on 18/12/2023.
////
//
//import Foundation
//import W3WSwiftApi
//import W3WSwiftComponents
//import CoreLocation
//
////G2HZOXO1
//
//override func viewDidLoad() {
//     super.viewDidLoad()
//     // instantiate the API
//     let api = What3WordsV3(apiKey: "G2HZOXO1")
//     // make the text field, and give it a place in the view
//     let textField = W3WAutoSuggestTextField(frame: CGRect(x: 16.0, y: (UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 64.0) + 16.0, width: view.frame.size.width - 32.0, height: 32.0))
//     // assign the API to the text field
//     textField.set(api)
//     // tell autosuggest where the user is to get more relevant resultes use focus
//     textField.set(options: W3WOption.focus(coords))
//    
//     // assign a code block to execute when the user has selected an address
//     textField.suggestionSelected = { suggestion in
//       print(suggestion.words ?? "")
//     }
//     // the error can be captured using onError
//     textField.onError = { error in
//       print(String(describing: error))
//     }
//     // place in the view
//     view.addSubview(textField)
//   }
