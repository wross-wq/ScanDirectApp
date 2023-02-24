//
//  ContentView.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/23/23.
//

import SwiftUI
import CoreData
import Introspect
import FBAuthentication

struct ContentView: View {
    let keyStrokeSubject = KeyInputSubjectWrapper()
    @StateObject var store: Store = Store.shared
    @EnvironmentObject var userInfo: UserInfo

    var body: some View {
       LoadingView(startView: PhoneLoginView(showSheet: .constant(true),
                                             primaryColor: .systemGreen,
                                             secondaryColor: .systemGray))
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserInfo())
    }
}
