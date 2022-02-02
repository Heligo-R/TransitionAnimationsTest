import SwiftUI
import NavigationStack

struct HomeView: View {
    @Binding var mode: Mode
    @EnvironmentObject private var navigationStack: NavigationStack

    let transitionController = TransitioningController()
    var viewController = UIHostingController(rootView: MenuView(mode: .constant(.home)))
    
    var body: some View {
        VStack(spacing: 24) {
            Button("Transitioning Delegate") {
                let visibleController = UIApplication.shared.keyWindow?.rootViewController
                
                viewController.modalPresentationStyle = .custom
                viewController.transitioningDelegate = transitionController
                
                visibleController?.present(viewController, animated: true, completion: nil)
            }
            
            Button("ZStack with tranisition") {
                mode = .menu
            }
            
            Button("Navigation Stack library") {
                navigationStack.push(NavigationStackMenuView())
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(mode: .constant(.home))
    }
}
