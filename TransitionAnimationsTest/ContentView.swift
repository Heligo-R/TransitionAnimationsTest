import SwiftUI
import NavigationStack

struct ContentView: View {
    @State var mode = Mode.home
    
    var body: some View {
        ZStack {
            switch mode {
            case .home:
                NavigationStackView(transitionType: .custom(.move(edge: .leading))) {
                    HomeView(mode: $mode)
                }
            case .menu:
                MenuView(mode: $mode)
                    .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut, value: mode)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
