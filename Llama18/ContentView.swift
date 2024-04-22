//
//  ContentView.swift
//  Llama
//
//  Created by Fabiano Calvay on 3/30/24.
//
import SwiftUI
import PassKit
import Combine

struct welcomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    Image("llama")
                        .resizable()
                        .frame(width: 150, height: 150)
                    
                    Spacer().frame(height: 0)
                    
                    HStack {
                        NavigationLink(destination: LogginView()) {
                            ZStack {
                                            RoundedRectangle(cornerRadius: 40.0)
                                                .fill(Color(.gray))
                                            
                                            
                                            Text("Loggin")
                                                .foregroundColor(.black)
                                                .fontWeight(.semibold)
                            }
                        }
                        
                        NavigationLink(destination: CreateAccountView()) {
                            ZStack {
                                    RoundedRectangle(cornerRadius: 40.0)
                                        .fill(Color(.gray))
                                    Text("Crear Cuenta")
                                        .foregroundColor(.black)
                                        .fontWeight(.semibold)
                            }
                        }
                        
                        
                    }.frame(maxHeight: 100)
                        .offset(y: 170)
                }
            }
        }
    }
}

class UserInfo: ObservableObject{
    @Published var textFieldName: String
    @Published var textFieldLastName: String
    @Published var textFieldMail: String
    @Published var textFieldPhone: String
    @Published var textFieldId: String
    
    init(Name: String = "", LastName: String = "", Mail: String = "", Number: String = "", Id: String = "") {
        self.textFieldName = Name
        self.textFieldLastName = LastName
        self.textFieldMail = Mail
        self.textFieldPhone = Number
        self.textFieldId = Id
        
    }
}

struct CreateAccountView: View {
    @EnvironmentObject var userInfo: UserInfo
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HStack {
                        Spacer().frame(width: 15)
                        Text("Comenzemos !")
                            .fontWeight(.bold)
                            .font(.system(size: 30))
                        Spacer()
                    }
                    
                    Spacer().frame(height: 10)
                    
                    HStack {
                        Spacer().frame(width: 15)
                        Text("Escribe tu numero de telefono. Nosotros te enviaremos un codigo de confirmacion ahi.")
                            .foregroundStyle(Color(.gray))
                        Spacer()
                    }
                    
                    Spacer().frame(height: 40)
                    
                    HStack {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.white))
                                .opacity(0.12)
                                .frame(maxWidth: 100)
                                .frame(maxHeight: 60)
                            HStack {
                                Image("peru")
                                    .resizable()
                                    .frame(maxHeight: 30)
                                .frame(maxWidth: 30)
                                
                                Text("+51")
                                   
                            }
                        }
                        
                        Spacer().frame(width: 10)
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.white))
                                .opacity(0.2)
                                .frame(maxWidth: 300)
                                .frame(maxHeight: 60)
                            HStack {
                                TextField("", text: $userInfo.textFieldPhone, prompt: Text("Numero de telefono").foregroundStyle(Color(red: 200/255, green: 200/255, blue: 200/255)))
                                    .keyboardType(.numberPad)
                                    .padding(.leading, 20)
                                   
                            }
                        }
                    }.padding(.leading, 15)
                        .padding(.trailing, 15)

                    Spacer()
                    
                    HStack{
                        NavigationLink (destination: userDataName()) {
                            ZStack{
                                HStack{
                                    RoundedRectangle(cornerRadius: 45)
                                        .foregroundStyle(Color(red: 76/255, green: 0/255, blue: 153/255))
                                        .opacity(0.7)
                                }.frame(maxHeight: 60)
                                HStack{
                                    Text("Continue")
                                        .foregroundStyle(Color(.gray))
                                        .fontWeight(.semibold)
                                }
                            }
                        }
                  //      .onTapGesture {
                    //        userInfo.textFieldPhone = textFieldPhone
                      //  }
                    }
                }
            }
        }
    }
}

struct userDataName: View{
    @EnvironmentObject var userInfo: UserInfo
    var body: some View{
        NavigationStack {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                VStack{
                    ZStack{
                        HStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.white))
                                .opacity(0.12)
                                .frame(maxWidth: 250)
                            .frame(maxHeight: 60)
                            Spacer()
                        }
                        HStack {
                            TextField("", text: $userInfo.textFieldName, prompt: Text("Nombre").foregroundStyle(Color(red: 200/255, green: 200/255, blue: 200/255)))
                            Spacer()
                                
                        }.padding(.leading, 15)
                    }
                    
                    ZStack{
                        HStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.white))
                                .opacity(0.12)
                                .frame(maxWidth: 250)
                            .frame(maxHeight: 60)
                            Spacer()
                        }
                        HStack {
                            TextField("", text: $userInfo.textFieldLastName, prompt: Text("Apellido").foregroundStyle(Color(red: 200/255, green: 200/255, blue: 200/255)))
                               Spacer()
                        }.padding(.leading, 15)
                    }
                    
                    ZStack{
                        HStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.white))
                                .opacity(0.12)
                                .frame(maxWidth: 250)
                            .frame(maxHeight: 60)
                            Spacer()
                        }
                        HStack {
                            TextField("", text: $userInfo.textFieldId, prompt: Text("Documento de identidad").foregroundStyle(Color(red: 200/255, green: 200/255, blue: 200/255)))
                               Spacer()
                        }.padding(.leading, 15)
                    }
                    
                    
                    Spacer()
                    
                    HStack{
                        NavigationLink(destination: emailData()) {
                            ZStack{
                                HStack{
                                    RoundedRectangle(cornerRadius: 45)
                                        .foregroundStyle(Color(red: 76/255, green: 0/255, blue: 153/255))
                                        .opacity(0.7)
                                }.frame(maxHeight: 60)
                                
                                HStack{
                                    Text("Continue")
                                        .foregroundStyle(Color(.gray))
                                        .fontWeight(.semibold)
                                }
                                
                                
                           /*     .onAppear {
                                    textFieldName = userInfo.textFieldName
                                    textFieldLastName = userInfo.textFieldLastName
                                    textFieldId = userInfo.textFieldId
                                }
                           */
                                
                            }
                        }
                    }
                }
            }
        }
    }
}

struct emailData: View{
    @EnvironmentObject var userInfo: UserInfo
    var body: some View{
        NavigationStack {
            VStack{
                HStack {
                    Spacer().frame(width: 15)
                    Text("Correo Electronico")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                    Spacer()
                }
                Spacer().frame(height: 10)
                HStack {
                    Spacer().frame(width: 15)
                    Text("Escribe tu correo electronico para asociarlo a tu cuenta ")
                        .foregroundStyle(Color(.gray))
                    Spacer()
                }
                
                Spacer().frame(height: 50)
                
                ZStack{
                    HStack {
                        Spacer().frame(width: 15)
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.white))
                            .opacity(0.2)
                            .frame(maxWidth: 350)
                        .frame(maxHeight: 60)
                        Spacer()
                    }
                    HStack {
                        TextField("", text: $userInfo.textFieldMail, prompt: Text("Correo electronico").foregroundStyle(Color(red: 200/255, green: 200/255, blue: 200/255)))
                            .keyboardType(.numberPad)
                            .padding(.leading, 30)
                           
                    }
                }
                
                Spacer()
                
                HStack{
                    NavigationLink (destination: UserDataTest()) {
                        ZStack{
                            HStack{
                                RoundedRectangle(cornerRadius: 45)
                                    .foregroundStyle(Color(red: 76/255, green: 0/255, blue: 153/255))
                                    .opacity(0.7)
                            }.frame(maxHeight: 60)
                            HStack{
                                Text("Continue")
                                    .foregroundStyle(Color(.gray))
                                    .fontWeight(.semibold)
                            }
                        }
                    }
                /*    .onAppear {
                                    textFieldMail = userInfo.textFieldMail
                                }
                 */
                }
            }
        }
    }
}

struct UserDataTest: View {
    @EnvironmentObject var userInfo: UserInfo
    var body: some View {
        VStack {
            Text(userInfo.textFieldName)
                .foregroundStyle(Color(.red))
            Text(userInfo.textFieldLastName)
                .foregroundStyle(Color(.red))
            Text(userInfo.textFieldMail)
                .foregroundStyle(Color(.red))
            Text(userInfo.textFieldPhone)
                .foregroundStyle(Color(.red))
            Text(userInfo.textFieldId)
        }
    }
}



struct ContentView: View {
    @StateObject var userInfo = UserInfo()
  var body: some View {
    NavigationStack {
      welcomeView()
            .environmentObject(userInfo)
    }
  }
}

struct LogginView: View {
    var body: some View {
        VStack {
            Text("Loggin")
        }
    }
}


//Main Stuff



enum SubviewType {
    case main
    case transfers
    case crypto
}

struct ViewSwitcher: View {
    @State private var selectedSubview = SubviewType.main
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            ZStack{
                VStack{
                    VStack(spacing: 0) {
                        switch selectedSubview {
                        case .main: MainView()
                        case .transfers: TransfersView()
                        case .crypto: CryptoView()
                        }
                    } .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                VStack{
                    TopDockView(selectedSubview: $selectedSubview , searchText: $searchText)
                    Spacer()
                    BottomDockView(selectedSubview: $selectedSubview)
                }
            }.ignoresSafeArea(.keyboard)
        }
        }
    }

enum SubviewTypeBank {
    case localBank
    case swiftBank
}

//Main Views

struct MainView: View {
    @State private var searchText = ""
    var body: some View {
            ZStack{
                VStack{
                    BackgroundMain()

                }
                ScrollView{
                    ZStack {
                        GeometryReader { geometry in
                            VStack {
                                Spacer().frame(height: 430)
                                BackgroundSecond()
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .frame(minHeight: geometry.size.height + 400)
                        }

                        VStack {
                            Spacer().frame(height: 100)
                            BalanceView()
                            Spacer().frame(height: 80)
                            ButtonsDock()
                            LatestTransfer()
                            LatestTransfer()
                            LatestTransfer()
                        }
                    }
                }
            }
    }
}

struct TransfersView: View {
    var body: some View {
        ZStack{
            VStack {
                HStack{
                    Color(.black)
                }.frame(minHeight: 10)
                Spacer()
            }.ignoresSafeArea()
            VStack{
                Spacer().frame(height: 20)
            ListView()
                .ignoresSafeArea()
            }
            VStack{
            }
        }
        }
    }

struct CryptoView: View {
    var body: some View {
        Text("CryptoView")
    }
}

//MainDocks

struct TopDockView: View {
    @Binding var selectedSubview: SubviewType
    @Binding var searchText: String

    private func dockButton(symbolName: String, target: SubviewType) -> some View {
        Image(systemName: symbolName)
            .font(.system(size: 28, weight: .medium, design: .default))
            .foregroundColor(.white)
            .frame(maxWidth: 45)
    }

    var body: some View {
        HStack (spacing: 0) {
            dockButton(symbolName: "person.circle.fill", target: .main)
            MainSearchBar(text: $searchText).frame(maxWidth: 250).padding(.leading, 0)
            dockButton(symbolName: "chart.pie.fill", target: .transfers)
            dockButton(symbolName: "creditcard", target: .crypto)
        }
        .frame(minHeight: 50)
        .offset(y: -10)
        
    }
}

struct BottomDockView: View {
    @Binding var selectedSubview: SubviewType

    private func dockButton(symbolName: String, target: SubviewType) -> some View {
        Image(systemName: symbolName)
            .font(.system(size: 24, weight: .medium, design: .default))
            .symbolVariant(selectedSubview == target ? .fill : .none)
            .foregroundStyle(selectedSubview == target ? .black : .gray)
            .onTapGesture { selectedSubview = target }
            .frame(maxWidth: .infinity)
    }

    var body: some View {
        HStack {
            dockButton(symbolName: "house", target: .main)
            dockButton(symbolName: "arrow.left.arrow.right", target: .transfers)
            dockButton(symbolName: "bitcoinsign", target: .crypto)
        }
        .frame(minHeight: 50)
        .background(.gray.opacity(0.4))
        
    }
}


//RootViews

struct BalanceView: View{
    
    var body: some View {
        VStack {
            Text("Main · \(currencyTicker.first?.ticker ?? "")")
                .foregroundStyle(Color(.white))

            Text("s/. 69").foregroundStyle(Color(.white))
                .font(.system(size: 45))
                .fontWeight(.bold)
            
            AccountsButtonView()
                .padding(.top, -20)
            
            
            
        }
    }
}

struct AccountsButtonView: View{
    var body: some View{
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text("Cuentas")
                .foregroundStyle(Color(.white))
                .padding()
                .background(Color(.white))
                .opacity(0.5)
                .cornerRadius(35.0)
        })
    }
}

struct ButtonsDock: View{
    var body: some View{
        
            HStack{
                VStack{
                    NavigationLink(destination: ChoosePaymentMethod()) {
                        Image(systemName: "plus")
                            .font(.system(size: 20, weight: .medium, design: .default))
                            .foregroundColor(.white)
                            .frame(minWidth: 90, minHeight: 60)
                            .background(Color(.white))
                            .clipShape(Circle())
                        .opacity(0.2)
                    }
                    Text("Añadir")
                        .foregroundStyle(Color(.white))
                }
                VStack{
                    NavigationLink(destination: ExchangeView()){
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .font(.system(size: 20, weight: .medium, design: .default))
                            .foregroundColor(.white)
                            .frame(minWidth: 90, minHeight: 60)
                            .background(Color(.white))
                            .clipShape(Circle())
                            .opacity(0.2)
                    }
                        Text("Cambiar")
                            .foregroundStyle(Color(.white))
                }
                VStack{
                    NavigationLink(destination: DetailsView()){
                        Image(systemName: "doc.text.magnifyingglass")
                            .font(.system(size: 20, weight: .medium, design: .default))
                            .foregroundColor(.white)
                            .frame(minWidth: 90, minHeight: 60)
                            .background(Color(.white))
                            .clipShape(Circle())
                            .opacity(0.2)
                    }
                        Text("Detalles")
                            .foregroundStyle(Color(.white))
                }
                VStack{
                    NavigationLink(destination: MoreView()){
                        Image(systemName: "ellipsis")
                            .font(.system(size: 20, weight: .medium, design: .default))
                            .foregroundColor(.white)
                            .frame(minWidth: 90, minHeight: 60)
                            .background(Color(.white))
                            .clipShape(Circle())
                            .opacity(0.2)
                    }
                        Text("Más")
                            .foregroundStyle(Color(.white))
                }
            }
        }
    }

struct AddView: View {
                
                init() {
                UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
                }
                
                var body: some View {
                    NavigationView {
                        ZStack {
                            VStack {
                                Color.black
                                    .ignoresSafeArea()
                            }
                                Spacer()
                            VStack {
                                HStack {
                                    Image(systemName: "shield.checkered")
                                        .padding(.leading, 17)
                                        .padding(.trailing, 0)
                                        .foregroundStyle(Color(.purple))
                                    Text("Your money is held in licensed banks")
                                        .padding(.leading, 0)
                                        .foregroundStyle(Color(.purple))
                                    Spacer()
                                    } //purple text
                                Spacer().frame(height: 30)
                                
                                
                                
                                HStack {
                                    ZStack {
                                        GeometryReader {geometry in
                                            HStack{
                                                RoundedRectangle(cornerRadius: 20)
                                                    .fill(Color.gray)
                                                    .frame(maxWidth: .infinity, maxHeight: 120)
                                                    .opacity(0.2)
                                            }
                                            
                                            HStack{
                                                Image(systemName: "person.2.fill")
                                                    .foregroundStyle(Color.white)
                                                    .padding(.trailing, 5)
                                                    .padding(.leading, 20)
                                                
                                                Spacer()
                                                
                                                VStack{
                                                    HStack{
                                                        Text("BANCO DEL CREDITO DEL PERU")
                                                            .foregroundStyle(Color(.white))
                                                            .fontWeight(.bold)
                                                        
                                                            
                                                        Spacer()
                                                    }
                                                    .padding(.trailing, 0)
                                                    HStack{
                                                        Text("VISA ··7099 ")
                                                            .foregroundStyle(Color(.gray))
                                                        Spacer()
                                                    }
                                                    .padding(.trailing, 0)
                                                }.frame(minWidth: 200)
                                                
                                                Spacer()
                                                
                                                Button(action: {}) {
                                                            Text("Change")
                                                                .padding()
                                                                .background(Color(.purple))
                                                                .foregroundColor(Color.white.opacity(69)) // Set text color with adjusted opacity
                                                                .cornerRadius(35.0)
                                                                .opacity(0.4) // Set the opacity of the button background
                                                        }
                                                        .buttonStyle(PlainButtonStyle())
                                                        .padding(.leading, 0)
                                                        .offset(x: -20)
                                                
                                                Spacer()
                                                Spacer()
                                                
                                            }.frame(maxWidth: .infinity, maxHeight: 120)
                                        }
                                    }
                                }.padding(.leading, 20)
                                    .padding(.trailing, 20)
                                Spacer()
                            }
                                Spacer()
                        }
                        .navigationBarTitle("Add money")
                    }
                }
            }

struct ChoosePaymentMethod: View{
    
    init() {
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 34, weight: .heavy) // Adjust the size and weight as needed
        ]
        UINavigationBar.appearance().largeTitleTextAttributes = attributes
    }

    
    var body: some View{
        
        NavigationStack {
            
            ZStack{
                HStack{
                    Color(red: 28/255, green: 27/255, blue: 29/255)
                }.ignoresSafeArea()
                    .navigationBarTitle("")
                    .navigationBarTitleDisplayMode(.inline)
                
    
                VStack{
                    HStack {
                        Spacer().frame(width: 20)
                        Text("Como agregar dinero")
                            .foregroundStyle(Color(.white))
                            .fontWeight(.heavy)
                            .font(.system(size: 30))
                        Spacer()
                    }
                    Spacer().frame(height: 40)
                    HStack{
                        Spacer().frame(width: 20)
                        Text("Recommended")
                            .foregroundStyle(Color(.white))
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                        Spacer()
                    } //recommendedText
                    
                    Spacer().frame(height: 25)
                    
                    ZStack {
                        GeometryReader {geometry in
                            HStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.gray)
                                    .frame(maxWidth: .infinity, maxHeight: 120)
                                    .opacity(0.2)
                                    .padding(.leading, 15)
                                    .padding(.trailing, 15)
                            }  //rectangle
                            NavigationLink (destination: BankViewSwitcher()){
                                HStack{
                                    
                                    Spacer().frame(width: 10)
                                    
                                    Image(systemName: "building.columns.circle.fill")
                                        .font(.system(size: 45))
                                        .foregroundStyle(Color.white)
                                        .padding(.trailing, 5)
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                    
                                    VStack{
                                        HStack{
                                            Text("Bank transfer")
                                                .foregroundStyle(Color(.white))
                                                .fontWeight(.bold)
                                                .font(.system(size: 20))
                                            
                                                
                                            Spacer()
                                        }
                                        .padding(.trailing, 0)
                                        Spacer().frame(height: 1)
                                        
                                        
                                        .padding(.trailing, 0)
                                    }
                                    
                                    Spacer().frame(width: 10)
                                    
                                    
                                    Spacer()
                                    Spacer()
                                    
                                }.frame(maxWidth: .infinity, maxHeight: 120)
                            } //insideRectangle
                        }
                    }.frame(maxHeight: 170) //firstRectangle

                    HStack{
                        Spacer().frame(width: 20)
                        Text("Others")
                            .foregroundStyle(Color(.white))
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                        Spacer()
                    } //othersText
                    
                    Spacer().frame(height: 25)
                    
                    ZStack {
                        GeometryReader {geometry in
                            HStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.gray)
                                    .frame(maxWidth: .infinity, maxHeight: 120)
                                    .opacity(0.2)
                                    .padding(.leading, 15)
                                    .padding(.trailing, 15)
                            }  //secondrectangle
                            NavigationLink (destination: ApplePayView()) {
                                HStack{
                                    Spacer().frame(width: 10)
                                    Image("apple-pay-logo-icon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 55)
                                        .foregroundStyle(Color.white)
                                        .padding(.trailing, 5)
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                    
                                    VStack{
                                        HStack{
                                            Text("Apple pay")
                                                .foregroundStyle(Color(.white))
                                                .fontWeight(.bold)
                                                .font(.system(size: 20))
                                            Spacer()
                                        }
                                        .padding(.trailing, 0)
                                        Spacer().frame(height: 1)
                                    }
                                    
                                    Spacer().frame(width: 10)
                                    
                                    Spacer()
                                    Spacer()
                                    
                                }.frame(maxWidth: .infinity, maxHeight: 120)
                            } //insideSecondRectangle
                        }
                    }.frame(maxHeight: 130) //secondRectangle
                    
                    ZStack {
                        GeometryReader {geometry in
                            HStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.gray)
                                    .frame(maxWidth: .infinity, maxHeight: 120)
                                    .opacity(0.2)
                                    .padding(.leading, 15)
                                    .padding(.trailing, 15)
                            }  //rectangle
                            HStack{
                                Spacer().frame(width: 10)
                                Image(systemName: "creditcard")
                                    .font(.system(size: 41))
                                    .foregroundStyle(Color.white)
                                    .padding(.trailing, 5)
                                    .padding(.leading, 20)
                                
                                Spacer()
                                
                                NavigationLink (destination: DebitCardView()) {
                                    VStack{
                                        HStack{
                                            Text("Add debit card")
                                                .foregroundStyle(Color(.white))
                                                .fontWeight(.bold)
                                                .font(.system(size: 20))
                                            Spacer()
                                        }
                                        .padding(.trailing, 0)
                                        Spacer().frame(height: 1)
                                    }
                                }
                                
                                Spacer().frame(width: 10)
                                
                                
                                
                                
                                
                                /*
                                 Button(action: {}) {
                                             Text("Change")
                                                 .padding()
                                                 .background(Color(.purple))
                                                 .foregroundColor(Color.white.opacity(69)) // Set text color with adjusted opacity
                                                 .cornerRadius(35.0)
                                                 .opacity(0.4) // Set the opacity of the button background
                                         }
                                         .buttonStyle(PlainButtonStyle())
                                         .padding(.leading, 0)
                                         .offset(x: -20)
                                 */
                                
                                Spacer()
                                Spacer()
                                
                            }.frame(maxWidth: .infinity, maxHeight: 120) //insideRectangle
                        }
                    }.frame(maxHeight: 170) //thirdRectangle
                    
                    Spacer()
                }
            }
        }
    }
}


    
struct BankViewSwitcher: View {
    @State private var selectedSubviewBank = SubviewTypeBank.localBank

    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack {
                        Color(red: 27/255, green: 28/255, blue: 32/255)
                            .padding(.top, -600)
                            .padding(.bottom, -1000)
                            .ignoresSafeArea()
                    }
                    VStack {
                        Spacer().frame(height: 10)
                        HStack{
                            Text("Use these account details to send money to your Llama account")
                                .foregroundStyle(Color(.gray))
                                .font(.system(size: 12))
                        }.padding(.bottom, -40)
                        VStack {
                            ZStack {
                                HStack {
                                    RoundedRectangle(cornerRadius: 20)
                                    .foregroundStyle(Color(.darkGray))
                                }.padding(.leading, 20)
                                    .padding(.trailing, 20)
                                    .frame(minHeight: 35)

                                GeometryReader {geometry in
                                    HStack {
                                        Spacer()
                                        HStack {
                                            VStack {
                                            Spacer()
                                                Text("Local")
                                                    .foregroundColor(.gray)
                                                    .onTapGesture {
                                                        self.selectedSubviewBank = .localBank
                                                    }
                                                    .background(
                                                        RoundedRectangle(cornerRadius: 20)
                                                            .stroke(selectedSubviewBank == .localBank ? Color.purple : Color.clear, lineWidth: 3)
                                                            .background(selectedSubviewBank == .localBank ? Color.purple.opacity(0.2) : Color.clear)
                                                            .frame(width: geometry.size.width / 2 - 19)
                                                            .padding(.leading, 14)
                                                            .frame(minHeight: geometry.size.height / 1.27)
                                                            .padding(.bottom, 1.4)
                                                    )
                                            Spacer()
                                            }
                                        }
                                        
                                        
                                        Spacer().frame(width: geometry.size.width / 6)
                                        Spacer().frame(width: geometry.size.width / 6)
                                        HStack {
                                            VStack {
                                                Text("SWIFT")
                                                    .foregroundColor(.gray)
                                                    .onTapGesture {
                                                        self.selectedSubviewBank = .swiftBank
                                                    }
                                                    .background(
                                                        RoundedRectangle(cornerRadius: 20)
                                                            .stroke(selectedSubviewBank == .swiftBank ? Color.purple : Color.clear, lineWidth: 2)
                                                            .background(selectedSubviewBank == .swiftBank ? Color.purple.opacity(0.2) : Color.clear)
                                                            .frame(width: geometry.size.width / 2 - 19)
                                                            .frame(minHeight: geometry.size.height / 1.27)
                                                            .padding(.bottom, 1.4)
                                                    )
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                }
                            }
                            
                            .frame(maxHeight: 100)
                            .padding(.top, 60)
                            Spacer()
                        }
                        .frame(maxHeight: 50)
                        Spacer().frame(height: 35)
                        VStack {
                            VStack {
                                switch selectedSubviewBank {
                                case .localBank:
                                    LocalTransferView()
                                case .swiftBank:
                                    BankTransfersSwiftView()
                                }
                            }
                        }
                    }
                    
                }
            }
        }
    }
}

struct LocalTransferView: View{
    
    let userName = "Fabiano Josue Calvay Espinoza"
    let accountNumber = "81472242"
    let sortCode = "04-29-09"
    let bankDetails = "Llama Ltd. Condominio Santa Monica "
    private var pasteboard = UIPasteboard.general
    func copyToClipboard() {
        pasteboard.string = self.userName
    }
    func copyToClipboardAccount() {
        pasteboard.string = self.accountNumber
    }
    func copyToClipboardSortCode() {
        pasteboard.string = self.sortCode
    }
    func copyToClipboardBank() {
        pasteboard.string = self.bankDetails
    }
    
    var body: some View{
        ZStack{
            VStack{Color(red: 27/255, green: 28/255, blue: 32/255)}.ignoresSafeArea()
            VStack {
                HStack {
                    Text("For domestic transfers only")
                        .foregroundStyle(Color(.white))
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Spacer()
                    Text("Share").foregroundStyle(Color(.purple))
                        .font(.system(size: 15))
                }
                .padding(.leading, 15)
                .padding(.trailing, 15)
                //ForDomesticTransfersOnlyText
                
                
                ZStack {
                    HStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.lightGray))
                            .opacity(0.07)
                            .padding(.leading, 15)
                            .padding(.trailing, 15)
                        
                    }
                    VStack{
                        HStack{
                            Spacer().frame(width: 15)
                            VStack(alignment:.leading) {
                                HStack{Text("Beneficiary")}.foregroundStyle(Color(.gray))
                                HStack{Text(userName).foregroundStyle(Color(.purple))
                                }
                            }.padding(.top, 15)
                            Spacer()
                            VStack {
                                Spacer().frame(height: 33)
                                Button(action: {
                                    copyToClipboard()
                                }, label: {
                                    Image(systemName: "clipboard")
                                        .foregroundStyle(Color(.purple))
                                })
                                
                            }
                            
                            Spacer().frame(width: 30)
                        }
                        HStack{
                            Spacer().frame(width: 15)
                            VStack(alignment:.leading) {
                                HStack{Text("Account")}.foregroundStyle(Color(.gray))
                                HStack{Text(accountNumber).foregroundStyle(Color(.purple))
                                }
                            }.padding(.top, 15)
                            Spacer()
                            VStack {
                                Spacer().frame(height: 33)
                                Button(action: {
                                    copyToClipboardAccount()
                                }, label: {
                                    Image(systemName: "clipboard")
                                        .foregroundStyle(Color(.purple))
                                })
                            }
                            Spacer().frame(width: 30)
                        }
                        HStack{
                            Spacer().frame(width: 15)
                            VStack(alignment:.leading) {
                                HStack{Text("Sort Code")}.foregroundStyle(Color(.gray))
                                HStack{Text(sortCode).foregroundStyle(Color(.purple))
                                }
                            }.padding(.top, 15)
                            Spacer()
                            VStack {
                                Spacer().frame(height: 33)
                                Button(action: {
                                    copyToClipboardSortCode()
                                }, label: {
                                    Image(systemName: "clipboard")
                                        .foregroundStyle(Color(.purple))
                                })
                            }
                            Spacer().frame(width: 30)
                        }
                        HStack{
                            Spacer().frame(width: 15)
                            VStack(alignment:.leading) {
                                HStack{Text("Bank Name and Address")}.foregroundStyle(Color(.gray))
                                HStack{Text("Llama Ltd").foregroundStyle(Color(.purple))}
                                HStack{Text("Condominio Santa Monica").foregroundStyle(Color(.purple))}
                            }.padding(.top, 15)
                            Spacer()
                            VStack {
                                Spacer().frame(height: 33)
                                Button(action: {
                                    copyToClipboardBank()
                                }, label: {
                                    Image(systemName: "clipboard")
                                        .foregroundStyle(Color(.purple))
                                })
                            }
                            Spacer().frame(width: 30)
                        }.padding(.bottom, 15)
                    }
                    .padding(.leading, 15)
                    .padding(.trailing, 15)
                    .frame(maxWidth: .infinity)
                    
                    
                }
                .frame(maxHeight: 330)
                
                
                
                Spacer().frame(height: 20)
                
                
                
                ZStack {
                    HStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.lightGray))
                            .opacity(0.07)
                            .frame(maxHeight: 270)
                        
                    }
                    VStack {
                        HStack {
                            Spacer().frame(width: 20)
                            Image(systemName: "shield.checkered")
                                .font(.system(size: 30))
                            VStack(alignment: .leading) {
                                Text("Your money is held in licensed banks.")
                                    .font(.system(size: 13))
                                Text("Learn more")
                                    .font(.system(size: 13))
                                    .foregroundStyle(Color(.purple))
                            }
                            Spacer()
                        }//shield
                        
                        Spacer().frame(height: 20) // Add space between HStacks
                        
                        HStack {
                            Spacer().frame(width: 20)
                            Image(systemName: "lightbulb.min.fill")
                                .font(.system(size: 30))
                            Text("Only from a Peruvian Sol bank account")
                                .font(.system(size: 13))
                                .multilineTextAlignment(.leading) // Allow text to wrap
                            Spacer()
                        }//bulb
                        
                        Spacer().frame(height: 20) // Add space between HStacks
                        
                        HStack {
                            Spacer().frame(width: 20)
                            Image(systemName: "clock.fill")
                                .font(.system(size: 30))
                            Text("Transfers usually take a few hours to appear")
                                .font(.system(size: 13))
                                .multilineTextAlignment(.leading) // Allow text to wrap
                            Spacer()
                        }//clock
                        
                        Spacer().frame(height: 20) // Add space between HStacks
                        
                        HStack {
                            Spacer().frame(width: 20)
                            Image(systemName: "exclamationmark.triangle.fill")
                                .font(.system(size: 30))
                            Text("Only local transfers are accepted. For international transfers, please use SWIFT")
                                .font(.system(size: 13))
                                .multilineTextAlignment(.leading) // Allow text to wrap
                            Spacer()
                        }//danger
                    }
                    .foregroundStyle(Color(.white))
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                }
                .padding(.leading, 15)
                .padding(.trailing, 15)
                .frame(maxWidth: .infinity)
            }
        }
    }
}

struct BankTransfersSwiftView: View{
    let userName = "Fabiano Josue Calvay Espinoza"
    private var pasteboard = UIPasteboard.general
    func copyToClipboard() {
        pasteboard.string = self.userName
    }
    
    
    var body: some View{
        ScrollView {
            ZStack {
                VStack{
                    Color(red: 27/255, green: 28/255, blue: 32/255)
                        .padding(.top, -600)
                        .padding(.bottom, -1000)
                        .ignoresSafeArea()
                }
                
                VStack{
                    HStack {
                        Text("For cross-border transfers only")
                            .foregroundStyle(Color(.white))
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        Spacer()
                        Text("Share").foregroundStyle(Color(.purple))
                            .font(.system(size: 15))
                    }
                    .padding(.leading, 15)
                    .padding(.trailing, 15)
                    .padding(.bottom, 23)
                    ZStack {
                        HStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.lightGray))
                                .opacity(0.07)
                                .padding(.leading, 15)
                                .padding(.trailing, 15)
                            
                        }
                        VStack{
                            HStack{
                                Spacer().frame(width: 15)
                                VStack(alignment:.leading) {
                                    HStack{Text("Beneficiary")}.foregroundStyle(Color(.gray))
                                    HStack{Text(userName).foregroundStyle(Color(.purple))
                                    }
                                }.padding(.top, 20)
                                Spacer()
                                VStack {
                                    Spacer().frame(height: 33)
                                    
                                    Button(action: {
                                        copyToClipboard()
                                    }, label: {
                                        Image(systemName: "clipboard")
                                            .foregroundStyle(Color(.purple))
                                    })
                                }
                                
                                Spacer().frame(width: 30)
                            }
                            HStack{
                                Spacer().frame(width: 15)
                                VStack(alignment:.leading) {
                                    HStack{Text("IBAN")}.foregroundStyle(Color(.gray))
                                    HStack{Text("GB38 REVO 0099 7000 9191 46").foregroundStyle(Color(.purple))
                                    }
                                }.padding(.top, 15)
                                Spacer()
                                VStack {
                                    Spacer().frame(height: 33)
                                    Image(systemName: "clipboard")
                                        .foregroundStyle(Color(.purple))
                                }
                                Spacer().frame(width: 30)
                            }
                            HStack{
                                Spacer().frame(width: 15)
                                VStack(alignment:.leading) {
                                    HStack{Text("BIC / SWIFT code")}.foregroundStyle(Color(.gray))
                                    HStack{Text("REVOGB21").foregroundStyle(Color(.purple))
                                    }
                                }.padding(.top, 15)
                                Spacer()
                                VStack {
                                    Spacer().frame(height: 33)
                                    Image(systemName: "clipboard")
                                        .foregroundStyle(Color(.purple))
                                }
                                Spacer().frame(width: 30)
                                
                            }
                            HStack{
                                Spacer().frame(width: 15)
                                VStack(alignment:.leading) {
                                    HStack{Text("Bank name and Address")}.foregroundStyle(Color(.gray))
                                    HStack{Text("Llama Ltd").foregroundStyle(Color(.purple))}
                                    HStack{Text("Condominio Santa Monica").foregroundStyle(Color(.purple))}
                                }.padding(.top, 15)
                                Spacer()
                                VStack {
                                    Spacer().frame(height: 33)
                                    Image(systemName: "clipboard")
                                        .foregroundStyle(Color(.purple))
                                }
                                Spacer().frame(width: 30)
                                
                            }
                            HStack{
                                Spacer().frame(width: 15)
                                VStack(alignment:.leading) {
                                    HStack{Text("Correspondent BIC")}.foregroundStyle(Color(.gray))
                                    HStack{Text("CHASDEFX").foregroundStyle(Color(.purple))}
                                }.padding(.top, 15)
                                Spacer()
                                VStack {
                                    Spacer().frame(height: 33)
                                    Image(systemName: "clipboard")
                                        .foregroundStyle(Color(.purple))
                                }
                                Spacer().frame(width: 30)
                            }.padding(.bottom, 15)
                        }
                        .padding(.leading, 15)
                        .padding(.trailing, 15)
                        .frame(maxWidth: .infinity)
                        
                        
                    }
                    .frame(maxHeight: 330)
                    
                    Spacer().frame(height: 40)
                    
                    ZStack {
                        HStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.lightGray))
                                .opacity(0.07)
                                .frame(maxHeight: 270)
                            
                        }
                        VStack {
                            HStack {
                                Spacer().frame(width: 20)
                                Image(systemName: "shield.checkered")
                                    .font(.system(size: 30))
                                VStack(alignment: .leading) {
                                    Text("Your money is held in licensed banks.")
                                        .font(.system(size: 13))
                                    Text("Learn more")
                                        .font(.system(size: 13))
                                        .foregroundStyle(Color(.purple))
                                }
                                Spacer()
                            }//shield
                            
                            Spacer().frame(height: 20) // Add space between HStacks
                            
                            HStack {
                                Spacer().frame(width: 20)
                                Image(systemName: "lightbulb.min.fill")
                                    .font(.system(size: 30))
                                Text("Only from a Peruvian Sol bank account")
                                    .font(.system(size: 13))
                                    .multilineTextAlignment(.leading) // Allow text to wrap
                                Spacer()
                            }//bulb
                            
                            Spacer().frame(height: 20) // Add space between HStacks
                            
                            HStack {
                                Spacer().frame(width: 20)
                                Image(systemName: "clock.fill")
                                    .font(.system(size: 30))
                                Text("Transfers usually take a 3 - 5 days to appear")
                                    .font(.system(size: 13))
                                    .multilineTextAlignment(.leading) // Allow text to wrap
                                Spacer()
                            }//clock
                            
                            Spacer().frame(height: 20) // Add space between HStacks
                            
                            HStack {
                                Spacer().frame(width: 20)
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .font(.system(size: 30))
                                Text("Only local transfers are accepted. For international transfers, please use SWIFT")
                                    .font(.system(size: 13))
                                    .multilineTextAlignment(.leading) // Allow text to wrap
                                Spacer()
                            }//danger
                        }
                        .padding(.top, 15)
                        .padding(.bottom, 15)
                                   }
                                   .padding(.leading, 15)
                                   .padding(.trailing, 15)
                                   .frame(maxWidth: .infinity)
                               }
                
                .foregroundStyle(Color(.white))
            }
        }
    }
}


struct ApplePayView: View {
    @State private var textFieldValue: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                Color(red: 27/255, green: 28/255, blue: 32/255)
                    .ignoresSafeArea()
            } //blackBackground
            
            ScrollView {
                ZStack {
                    VStack {
                        HStack {
                            Text("Add money")
                                .foregroundStyle(Color(.white))
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .padding(.top, 10)
                            
                            Spacer()
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.lightGray))
                                .opacity(0.2)
                                .padding(.leading, 10)
                                .padding(.trailing, 15)
                            
                            HStack {
                                Image("apple-pay-logo-icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 55)
                                    .foregroundStyle(Color.white)
                                    .padding(.trailing, 5)
                                    .padding(.leading, 20)
                                
                                Text("Apple Pay")
                                    .foregroundStyle(Color(.white))
                                    .font(.system(size: 17))
                                    .fontWeight(.semibold)
                                
                                Spacer().frame(width: 80)
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(Color(.purple))
                                        .opacity(0.3)
                                        .frame(maxWidth: 90)
                                        .frame(minHeight: 50)
                                    Text("Change")
                                        .foregroundStyle(Color(.purple))
                                }
                                
                                Spacer()
                            }
                            .padding(.top, 30)
                            .padding(.bottom, 30)
                            .padding(.leading, 15)
                        }
                        
                        Spacer().frame(height: 13)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.lightGray))
                                .opacity(0.4)
                            
                            VStack {
                                HStack {
                                    Image("peru")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                    Text("PEN")
                                        .foregroundStyle(Color(.white))
                                        .font(.system(size: 20))
                                        .fontWeight(.regular)
                                    Spacer()
                                    TextField("s/. 0", text: Binding(
                                    get: { self.textFieldValue },
                                    set: { self.textFieldValue = "s/. \($0)" }
                                    ))
                                       .foregroundColor(Color.white)
                                       .font(.system(size: 25))
                                       .fontWeight(.bold)
                                       .padding(.leading, 5)
                                       .padding(.trailing, 5)
                                       .textFieldStyle(CustomTextFieldStyle()) // Use custom TextField style
                                       .accentColor(Color.white) // Set accent color
                                       .colorScheme(.dark) // Set color scheme to dark
                                       .padding(.trailing, 5) // Add padding to make placeholder visible
                                       .keyboardType(.decimalPad)
                                }
                                
                                HStack {
                                    Text("Balance: 0")
                                        .foregroundStyle(Color(.gray))
                                        .font(.system(size: 13))
                                    Spacer()
                                    Text("Minimum amount is s/. 20")
                                        .foregroundStyle(Color(.gray))
                                        .font(.system(size: 13))
                                }
                            }
                            .padding(.leading, 20)
                            .padding(.trailing, 10)
                            .padding(.top, 30)
                            .padding(.bottom, 30)
                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 15)
                        
                        
                        
                        HStack {
                            ApplePayButton(type: .buy, style: .black)
                                              .frame(maxWidth: 90)
                                              .frame(minHeight: 50)
                                              
                        }
                        
                        Spacer()
                    }
                    
                    ZStack {
                        Circle()
                            .fill(Color(.black))
                        Image(systemName: "arrow.down")
                            .foregroundStyle(Color(.gray))
                    }
                    .frame(width: 34, height: 34)
                    .padding(.top, 0) //57
                }
            }
        }
    }
}




struct DebitCardView: View{                                             //fix keyboardview
    @State private var cardNumber: String = ""
    @State private var expiryDate: String = ""
    @State private var CVV: String = ""
    var body: some View{
        ZStack{
            VStack{
                Color(red: 27/255, green: 28/255, blue: 32/255)
            }.ignoresSafeArea()
            ScrollView{
                VStack{
                    HStack{
                        Text("Card in your name")
                            .foregroundStyle(Color(.white))
                            .font(.system(size: 33))
                            .fontWeight(.bold)
                            .padding(.top, 10)
                        Spacer()
                    } //Card in your name title
                    
                    
                    Spacer().frame(height: 15)
                    
                    
                    HStack{
                        Image(systemName: "shield.checkered")
                            .foregroundStyle(Color(.purple))
                        Text("Processed securely by PCI DSS")
                            .foregroundStyle(Color(.purple))
                            .fontWeight(.semibold)
                            .font(.system(size: 16))
                        Spacer()
                    }//Processed securely by PCI DSS text
                    
                    
                    Spacer().frame(height: 20)
                    
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(.gray))
                            .opacity(0.3)
                            .frame(maxWidth: 400)
                            .frame(minHeight: 67)
                            
                        HStack {
                            VStack{
                                HStack {
                                    Text("Card Number")
                                        .foregroundStyle(Color(.gray))
                                        .font(.system(size: 13))
                                        .padding(.top, -10)
                                    Spacer()
                                }
                                
                                
                                Spacer().frame(height: 5)
                                HStack{
                                    Image(systemName: "creditcard.and.123")
                                        .resizable()
                                        .frame(maxWidth: 30)
                                        .frame(maxHeight: 25)
                                    TextField("", text: $cardNumber, prompt: Text("0000 0000 0000 0000").foregroundStyle(Color(red: 200/255, green: 200/255, blue: 200/255)))
                                        .keyboardType(.numberPad)
                                        
                                    Spacer()
                                }
                            }.frame(minWidth: 90)
                                .padding(.leading, 10)
                            
                            Spacer()
                            
                            VStack{
                                Image(systemName: "camera.fill")
                                    .resizable()
                                    .frame(maxWidth: 30)
                                    .frame(maxHeight: 25)
                                    .foregroundStyle(Color(.purple))
                                    
                            }.padding(.trailing, 20)
                            
                        }
                    } //first rectangle
                    
                    Spacer().frame(height: 15)
                    
                   
                    HStack {
                        ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color(.gray))
                                    .opacity(0.3)
                                    
                                    
                                HStack {
                                    VStack{
                                        HStack {
                                            Text("Expiry date")
                                                .foregroundStyle(Color(.gray))
                                                .font(.system(size: 13))
                                                .padding(.top, -10)
                                            Spacer()
                                        }
                                        
                                        
                                        Spacer().frame(height: 5)
                                        HStack{
                                            TextField("", text: $expiryDate, prompt: Text("MM/YY").foregroundStyle(Color(red: 200/255, green: 200/255, blue: 200/255)))
                                                .keyboardType(.numberPad)
                                                
                                            Spacer()
                                        }
                                    }.frame(minWidth: 90)
                                        .padding(.leading, 10)
                                    
                                    Spacer()
                                    
                                    
                                    
                                }
                            }.frame(maxWidth: 170)
                            .frame(minHeight: 67)
                        
                        Spacer()
                        
                        ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color(.gray))
                                    .opacity(0.3)
                                    
                                    
                                HStack {
                                    VStack{
                                        HStack {
                                            Text("CVV")
                                                .foregroundStyle(Color(.gray))
                                                .font(.system(size: 13))
                                                .padding(.top, -10)
                                            Spacer()
                                        }
                                        
                                        
                                        Spacer().frame(height: 5)
                                        HStack{
                                            TextField("", text: $CVV, prompt: Text("3 digits").foregroundStyle(Color(red: 200/255, green: 200/255, blue: 200/255)))
                                                .keyboardType(.numberPad)
                                                
                                            Spacer()
                                        }
                                    }.frame(minWidth: 90)
                                        .padding(.leading, 10)
                                    
                                    Spacer()
                                    
                                    
                                    
                                }
                            }.frame(maxWidth: 170)
                            .frame(minHeight: 67)
                    }
                    
                    Spacer().frame(height: 400)
                    
                    Text("We will save your card for future payments")
                        .font(.system(size: 12))
                        .foregroundStyle(Color(red: 200/255, green: 200/255, blue: 200/255))
                    
                    Spacer().frame(height: 20)
                    
                    GeometryReader {geometry in
                        ZStack{
                            HStack{
                                RoundedRectangle(cornerRadius: 45)
                                    .foregroundStyle(Color(red: 76/255, green: 0/255, blue: 153/255))
                                    .opacity(0.3)
                            }.frame(minHeight: 60)
                            HStack{
                                Text("Continue")
                                    .foregroundStyle(Color(.gray))
                                    .fontWeight(.semibold)
                            }
                        }
                    } //button
                    
                    
                    
                    
                }.padding(.leading, 15)
                .padding(.trailing, 15)
            }
            
        }
        
        
    }
}



struct ApplePayButton: UIViewRepresentable {
  let type: PKPaymentButtonType
  let style: PKPaymentButtonStyle

  func makeUIView(context: Context) -> PKPaymentButton {
    return PKPaymentButton(paymentButtonType: type, paymentButtonStyle: style)
  }

func updateUIView(_ uiView: PKPaymentButton, context: Context) {
    // No need for updates in this simple case
  }
}   //ApplePay need to fix at the end

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .multilineTextAlignment(.trailing)
    }
}

struct ExchangeView: View {
    
    @State private var textFieldValue: String = ""
    @State private var isArrowRotated: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Color(red: 27/255, green: 28/255, blue: 32/255)
                    .ignoresSafeArea()
            } //blackBackground
            
            ScrollView {
                ZStack {
                    VStack {
                        HStack {
                            Text("Buy 'PUT VAR HERE")
                                .foregroundStyle(Color(.white))
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .padding(.top, 10)
                            
                            Spacer()
                        }.padding(.leading, 15)
                        HStack{
                            Image("trending")
                                .resizable()
                                .frame(height: 20)
                                .frame(width: 20)
                                .foregroundStyle(Color(.purple))
                            Text("£1 = € 'EXCHANGE RATE HERE")
                                .foregroundStyle(Color(.purple))
                            
                            Spacer()
                        }.padding(.leading, 15)
                        
                        Spacer().frame(height: 30)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(isArrowRotated ? Color(.lightGray) : Color(.darkGray)) // Modify fill color based on arrow rotation
                                .opacity(0.4)
                            
                            VStack {
                                HStack {
                                    Image("peru")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                    Text("PEN")
                                        .foregroundStyle(Color(.white))
                                        .font(.system(size: 20))
                                        .fontWeight(.regular)
                                    Spacer()
                                    TextField("s/.0", text: $textFieldValue)
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 25))
                                        .fontWeight(.bold)
                                        .padding(.leading, 5)
                                        .padding(.trailing, 5)
                                        .textFieldStyle(CustomTextFieldStyle()) // Use custom TextField style
                                        .accentColor(Color.white) // Set accent color
                                        .colorScheme(.dark) // Set color scheme to dark
                                        .padding(.trailing, 5) // Add padding to make placeholder visible
                                        .keyboardType(.decimalPad)
                                }
                                
                                HStack {
                                    Text("Balance: 0")
                                        .foregroundStyle(Color(.gray))
                                        .font(.system(size: 13))
                                    Spacer()
                                    
                                }
                            }
                            .padding(.leading, 20)
                            .padding(.trailing, 10)
                            .padding(.top, 30)
                            .padding(.bottom, 30)
                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 15)
                        
                        Spacer().frame(height: 13)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(isArrowRotated ? Color(.darkGray) : Color(.lightGray)) // Modify fill color based on arrow rotation
                                .opacity(0.4)
                            
                            VStack {
                                HStack {
                                    Image("UK")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                    Text("GBP")
                                        .foregroundStyle(Color(.white))
                                        .font(.system(size: 20))
                                        .fontWeight(.regular)
                                    Spacer()
                                    TextField("£0", text: $textFieldValue)
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 25))
                                        .fontWeight(.bold)
                                        .padding(.leading, 5)
                                        .padding(.trailing, 5)
                                        .textFieldStyle(CustomTextFieldStyle()) // Use custom TextField style
                                        .accentColor(Color.white) // Set accent color
                                        .colorScheme(.dark) // Set color scheme to dark
                                        .padding(.trailing, 5) // Add padding to make placeholder visible
                                        .keyboardType(.decimalPad)
                                }
                                
                                HStack {
                                    Text("Balance: 0")
                                        .foregroundStyle(Color(.gray))
                                        .font(.system(size: 13))
                                    Spacer()
                                    
                                }
                            }
                            .padding(.leading, 20)
                            .padding(.trailing, 10)
                            .padding(.top, 30)
                            .padding(.bottom, 30)
                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 15)
                        
                        
                        Spacer().frame(height: 330)
                        
                        ZStack{
                            HStack{
                                RoundedRectangle(cornerRadius: 45)
                                    .foregroundStyle(Color(red: 76/255, green: 0/255, blue: 153/255))
                                    .opacity(0.3)
                            }.frame(minHeight: 60)
                            HStack{
                                Text("Continue")
                                    .foregroundStyle(Color(.gray))
                                    .fontWeight(.semibold)
                            }
                        }
                    }
                    
                    ZStack {
                        Circle()
                            .fill(Color(.black))
                        Image(systemName: "arrow.down")
                            .foregroundStyle(Color(.purple))
                            .rotationEffect(.degrees(isArrowRotated ? 180 : 0)) // Apply rotation
                            .onTapGesture {
                                withAnimation {
                                    isArrowRotated.toggle() // Toggle rotation
                                }
                            }
                    }
                    .frame(width: 34, height: 34)
                    .padding(.top, -160) //57
                }
            }
        }
    }
}

struct DetailsView: View{
    @State private var selectedSubviewBank = SubviewTypeBank.localBank
    var body: some View{
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack {
                        Color(red: 27/255, green: 28/255, blue: 32/255)
                            .padding(.top, -600)
                            .padding(.bottom, -1000)
                            .ignoresSafeArea()
                    } //background
                    VStack {
                        Spacer().frame(height: 10)
                        HStack{
                            VStack{
                                HStack {
                                    Text("£0")
                                        .foregroundStyle(Color(.white))
                                        .fontWeight(.heavy)
                                        .font(.system(size: 30))
                                    
                                    Image(systemName: "shield.checkered")
                                        .foregroundStyle(Color(.purple))
                                        .font(.system(size: 24))
                                    Spacer()
                                }
                                HStack {
                                    Text("Peruvian Sol")
                                        .foregroundStyle(Color(.white))
                                        Spacer()
                                }
                            }
                            Spacer()
                            VStack{
                                Image("peru")
                                    .resizable()
                                    .frame(height: 65)
                                    .frame(width: 65)
                            }
                        }
                        .padding(.leading, 15)
                        .padding(.trailing, 15)
                        
                        Spacer().frame(height: 0)
                        
                        VStack {
                            ZStack {
                                HStack {
                                    RoundedRectangle(cornerRadius: 20)
                                    .foregroundStyle(Color(.darkGray))
                                }.padding(.leading, 20)
                                    .padding(.trailing, 20)
                                    .frame(minHeight: 35)

                                GeometryReader {geometry in
                                    HStack {
                                        Spacer()
                                        HStack {
                                            VStack {
                                            Spacer()
                                                Text("Local")
                                                    .foregroundColor(.gray)
                                                    .onTapGesture {
                                                        self.selectedSubviewBank = .localBank
                                                    }
                                                    .background(
                                                        RoundedRectangle(cornerRadius: 20)
                                                            .stroke(selectedSubviewBank == .localBank ? Color.purple : Color.clear, lineWidth: 3)
                                                            .background(selectedSubviewBank == .localBank ? Color.purple.opacity(0.2) : Color.clear)
                                                            .frame(width: geometry.size.width / 2 - 19)
                                                            .padding(.leading, 14)
                                                            .frame(minHeight: geometry.size.height / 1.27)
                                                            .padding(.bottom, 1.4)
                                                    )
                                            Spacer()
                                            }
                                        }
                                        
                                        
                                        Spacer().frame(width: geometry.size.width / 6)
                                        Spacer().frame(width: geometry.size.width / 6)
                                        HStack {
                                            VStack {
                                                Text("SWIFT")
                                                    .foregroundColor(.gray)
                                                    .onTapGesture {
                                                        self.selectedSubviewBank = .swiftBank
                                                    }
                                                    .background(
                                                        RoundedRectangle(cornerRadius: 20)
                                                            .stroke(selectedSubviewBank == .swiftBank ? Color.purple : Color.clear, lineWidth: 2)
                                                            .background(selectedSubviewBank == .swiftBank ? Color.purple.opacity(0.2) : Color.clear)
                                                            .frame(width: geometry.size.width / 2 - 19)
                                                            .frame(minHeight: geometry.size.height / 1.27)
                                                            .padding(.bottom, 1.4)
                                                    )
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                }
                            }
                            
                            .frame(maxHeight: 100)
                            .padding(.top, 60)
                            Spacer()
                        }
                        .frame(maxHeight: 50)
                        Spacer().frame(height: 35)
                        VStack {
                            VStack {
                                switch selectedSubviewBank {
                                case .localBank:
                                    LocalTransferView()
                                case .swiftBank:
                                    BankTransfersSwiftView()
                                }
                            }
                        }
                    }
                    
                }
            }
        }
    }
}

struct MoreView: View{
    var body: some View{
        NavigationStack{
            Text("hola")
        }
    }
}

struct ListView: View {
    var body: some View {
        
        VStack{
            List {
                Section("") {
                    ForEach(contacts, id:\.name) { platform in
                        Label(platform.name, systemImage: platform.imageName)
                            .foregroundColor(platform.color)
                    }
                }.listRowBackground(Color(red: 32/255, green: 32/255, blue: 32/255))
            }
            .scrollContentBackground(.hidden)
            .background(Color.black)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct LatestTransfer: View{
    var body: some View{
        VStack {
            HStack{
                VStack(){
                    Image(systemName: "person.crop.circle.badge.plus")
                        .foregroundStyle(Color(.red))
                        .font(.system(size: 40, weight: .heavy, design: .default))
                        .foregroundColor(.gray)
                        .padding(.leading, 15)
                        .padding(.trailing,5)
                        
                }
                VStack(alignment: .leading) {
                    Text("Manolo")
                        .foregroundColor(Color.white)
                        .font(.system(size: 24, weight: .medium))
                    Text("Ayer, 08:40")
                        .foregroundColor(Color.gray)
                        .padding(.top, -10)
                    Text("TransactionCode")
                        .foregroundColor(Color.gray)
                }
                VStack{
                    Text("-.s/ 69")
                        .foregroundStyle(Color(.white))
                        .font(.system(size: 20, weight: .bold))
                        .frame(minWidth: 150,minHeight: 85)
                }
            }
            
            HStack{
                Text("Ver todas")
                    .foregroundStyle(Color(.purple))
                    .font(.system(size: 17, weight: .heavy))
                    .padding(.bottom, 15)
            }
            .padding(.top,15)
        }
        .padding(.top)
        .frame(minWidth: 360,minHeight: 90)
        .background(Gradient(colors: [Color(red:30/255, green: 30/255, blue: 30/255)]))
        .cornerRadius(15)
        
    }
}




//RootBackgrounds

struct BackgroundMain: View{
    var body: some View{
        VStack{
            HStack {
                LinearGradient(gradient: Gradient(colors: [Color.black, Color(red: 70/255, green: 64/255, blue: 96/255)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            }
        }
        .alignmentGuide(.top) { _ in 0 }
        .frame(maxHeight: 790)
        .offset(y: -30)
        .ignoresSafeArea()
    }
}

struct BackgroundSecond: View{
    var body: some View{
        VStack{
            HStack {
                Color(.black)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}


//extra

var contacts: [Contact] = [Contact(name: "marita", imageName: "person", color:.pink),
                           Contact(name: "Fabiano", imageName: "person", color:.blue),
                           Contact(name: "Manolo", imageName: "person", color:.mint),
                           Contact(name: "JoaquinPinga", imageName: "person", color:.mint),
                           Contact(name: "Manolo", imageName: "person", color:.mint),
                           Contact(name: "Manolo", imageName: "person", color:.mint),
                           Contact(name: "Manolo", imageName: "person", color:.mint),
                           Contact(name: "Manolo", imageName: "person", color:.mint),
                           Contact(name: "Manolo", imageName: "person", color:.mint),
                           Contact(name: "Manolo", imageName: "person", color:.mint),
                           Contact(name: "Manolo", imageName: "person", color:.mint),
                           Contact(name: "Manolo", imageName: "person", color:.mint),
                           Contact(name: "marita", imageName: "person", color:.pink),
                          Contact(name: "Fabiano", imageName: "person", color:.blue),
                          Contact(name: "Manolo", imageName: "person", color:.mint),
                          Contact(name: "Manolo", imageName: "person", color:.mint),
                          Contact(name: "Manolo", imageName: "person", color:.mint),
                          Contact(name: "Manolo", imageName: "person", color:.mint),
                          Contact(name: "Manolo", imageName: "person", color:.mint),
                          Contact(name: "Manolo", imageName: "person", color:.mint),
                          Contact(name: "Manolo", imageName: "person", color:.mint),
                          Contact(name: "Manolo", imageName: "person", color:.mint),
                          Contact(name: "Manolo", imageName: "person", color:.mint),
                          Contact(name: "Manolo", imageName: "person", color:.mint),
                                               
                           
                           
]

struct Contact {
    let name: String
    let imageName: String
    let color: Color
}

var currencyTicker: [Currency] = [Currency(name: "Sol", ticker: "SOL")]

struct Currency {
    let name: String
    let ticker: String
}

struct MainSearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Buscar", text: $text)
                .padding(7)
                .padding(.horizontal, 32)
                .background(Color.gray.opacity(0.7))
                .cornerRadius(18)
                .foregroundColor(.white)
                .padding(.leading, 10)
                .overlay(
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 20)
                        .padding(.vertical, 7)
                    , alignment: .leading
                )
        }.frame(minWidth: 240) //magnifyingGlass
    }
}





#Preview {
    ContentView()
        .environmentObject(UserInfo())
}
