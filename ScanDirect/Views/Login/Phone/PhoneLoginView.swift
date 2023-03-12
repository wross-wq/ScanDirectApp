//
//  PhoneLoginView.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/23/23.
//
import SwiftUI
import Foundation
import UIKit
import Firebase

class PhoneLoginViewModel : ObservableObject {
    @Published var text : [String] = []
    
    let db = Firestore.firestore()
    
    func writeData(text: String) {
        let docRef = db.document("Student-Info/Student-ID")
        docRef.setData(["text": text])
    }
    
    /*func getChildren() {
        ref.child("users").child(Auth.auth().currentUser?.uid ?? "noid").child("goals").observeSingleEvent(of: .value) { snapshot in
            
            self.children = snapshot.children.map { snap in
                snap.child("title").value
            }
        }
    }*/
}

struct PhoneLoginView: View {
    //@State var user: UserViewModel = UserViewModel()
    @ObservedObject var viewModel = PhoneLoginViewModel()
    @State var user: UserViewModel = UserViewModel()
    @Binding var showSheet: Bool
    @State private var showAlert = false
    var primaryColor: UIColor
    var secondaryColor: UIColor
    @State private var GoToPhoneNavigatoinView = false
    let db = Firestore.firestore()
    
    func getDocument(path: String, field: String? = "nil", completion:@escaping(String)->()){
        var returnVar : String = ""
        let db = Firestore.firestore()
        
        let docRef = db.document(path)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                if(field != "nil") {
                    let property = document.get("path") ?? "nil"
                    returnVar = property as! String
                    completion(returnVar)
                }
                else {
                    let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                    returnVar = dataDescription
                    completion(returnVar)
                }
            } else {
                print("Document does not exist")
                returnVar = "-1"
                completion(returnVar)
            }
        }
    }
        
    var body: some View {
            
        ZStack {
            Color("GGCDarkGreen")
                .edgesIgnoringSafeArea(.vertical)
            
            VStack {
                Text("ScanDirect")
                    .bold()
                    .foregroundColor(ggctheme.textColor)
                    .font(.largeTitle)
                    .padding([.bottom], 100)
                    .padding([.top], 10)
                
                    Image("GGCLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200, alignment: .center)
                        .padding([.bottom], 200)
                    
                    TextField("GGC ID",
                              text: $user.ggcId, prompt: Text("ggc ID").foregroundColor(.black))
                    .background(Color(.systemGray6))
                    .keyboardType(.numberPad)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 3)
                    }
                    SecureField("Password",
                                text: $user.password, prompt: Text("password").foregroundColor(.black))
                        .background(Color(.systemGray6))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 3)
                        }
                    
                    Button {
                        GoToPhoneNavigatoinView.toggle()
                        
                        getDocument(path: "Student-Info/Student-ID", field: "ID_1") {(value) in
                            if(value == user.ggcId){
                                GoToPhoneNavigatoinView = true
                            }
                        }
                        
                        getDocument(path: "Student-Info/Student-Password", field: "password1") {(value) in
                            if(value == user.password){
                                GoToPhoneNavigatoinView = true
                            }
                        }
                        /*let docRef = db.document("Student-Info/Student-ID")
                        docRef.getDocument { /*[weak self]*/ snapshot, error in
                            guard let data = snapshot?.data(), error == nil else {
                                return
                            }
                            
                             guard let text = data["text"] as? String else {
                                return
                            }
                            
                            DispatchQueue.main.async {
                                if (text.isEmpty){
                                    return
                                }
                            }
                        }*/
                        
                    } label: {
                        Text("Login")
                            .padding(.vertical, 15)
                            .frame(width: 200)
                            .background(Color(primaryColor))
                            .cornerRadius(8)
                            .foregroundColor(.black)
                            //.opacity(user.isLogInComplete ? 1 : 0.75)
                    }.fullScreenCover(isPresented: $GoToPhoneNavigatoinView){
                        PhoneNavigationView(showSheet: .constant(false),
                                            primaryColor: .systemGray2,
                                            secondaryColor: .systemGray2)
                        }
                        .padding(.vertical, 24)
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color("CardBackground"))
                        )
                        .padding(.horizontal)
                    Spacer()
                }
            }
        }
    }

struct PhoneLoginView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneLoginView(showSheet: .constant(false),
                       primaryColor: .systemGray,
                       secondaryColor: .systemGray)
    }
}
