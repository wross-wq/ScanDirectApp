//
//  Store.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/23/23.
//

import Foundation
import Combine
import SwiftUI
import UIKit

class Store: ObservableObject, UISplitViewControllerDelegate {
    
    static var shared: Store = Store()

    
    @Published var isLoadingSearch = false
    //@Published var searchResults: [Person]? = nil

    var imageCancellables: [AnyCancellable] = []
    
    /*func getLocations() {
        if !rooms.isEmpty {
            return
        }
        
        self.service.getLocations()
            .sink { result in
                switch (result) {
                case .finished:
                    break
                case .failure(let err):
                    print(err)
                }
            } receiveValue: { response in
                withAnimation {
                    self.rooms = response
                }
            }
    }*/
    
    var searchCancellable: AnyCancellable? = nil
    
    func searchUsers(query: String) {
        withAnimation {
            self.isLoadingSearch = true
        }

        if let cancellable = searchCancellable {
            cancellable.cancel()
        }

       /*self.searchCancellable = self.service.searchUsers(query: query)
            .sink(receiveCompletion: { result in
                withAnimation {
                    self.isLoadingSearch = false
                }

                if case let .failure(error) = result {
                    print(error)
                }
            }, receiveValue: { results in
                self.searchResults = results
            })*/
    }
    
    func splitViewControllerDidCollapse(_ svc: UISplitViewController) {
        print("WOOOOOOOOOOOOOOW")
    }
    
    func splitViewControllerDidExpand(_ svc: UISplitViewController) {
        print("Waaaaaaaaaaaw")
    }
    
    func splitViewController(_ svc: UISplitViewController,
                             willShow column: UISplitViewController.Column) {
        print("Wiiiiiiiiiw")
    }
    
    func splitViewController(_ svc: UISplitViewController, willHide column: UISplitViewController.Column) {
        print("Wuuuuuuuuuuuuuuw")
    }
}
