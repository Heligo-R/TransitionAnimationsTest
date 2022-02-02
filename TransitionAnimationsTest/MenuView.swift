import SwiftUI
import NavigationStack

struct MenuView: View {
    @Environment(\.presentationMode) var presentation
        
    @Binding var mode: Mode
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            Button("Dismiss") {
                if mode == .menu {
                    mode = .home
                } else {
                    presentation.wrappedValue.dismiss()
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(mode: .constant(.menu))
    }
}
