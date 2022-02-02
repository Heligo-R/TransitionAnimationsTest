import SwiftUI
import NavigationStack

struct NavigationStackMenuView: View {
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            PopView(destination: .previous) {
                Text("POP")
            }
        }
    }
}

struct NavigationStackMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackMenuView()
    }
}
