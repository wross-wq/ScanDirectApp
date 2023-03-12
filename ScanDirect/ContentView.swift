//
//  ContentView.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/23/23.
//

import SwiftUI
import CoreData
import Introspect
import Firebase

struct ContentView: View {
    let keyStrokeSubject = KeyInputSubjectWrapper()
    let db = Firestore.firestore()
    @StateObject var store: Store = Store.shared
    @State private var isSideBarOpened = false

    var body: some View {
        ZStack {
            NavigationView {
                PhoneLoginView(showSheet: .constant(false),
                                    primaryColor: .systemGray6,
                                    secondaryColor: .systemGray6)
            }
        }
        
       /* let docRef = db.document("Student-Info/Student-ID")
        docRef.getDocument { snapshot, error in
            guard let data = snapshot?.data(), error ==  nil else {
                return
            }
        }*/
    }
}

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
}
