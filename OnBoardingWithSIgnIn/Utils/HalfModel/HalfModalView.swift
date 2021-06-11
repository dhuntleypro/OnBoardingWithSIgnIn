//
//  HalfModalView.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/10/21.
//

import SwiftUI

// modal sometime refured to as modal
struct HalfModalView<Content:View>: View {

    
    @GestureState private var dragState = DragState.inactive
    @Binding var isShown: Bool
    
    var bgColor : UIColor
    var bgOpacityLevel : Double
    var dismissableBackground : Bool
    
    //var dismissableHeight : CGFloat = 200
    // account for tabview spacing
    var isNear_tabView = false
    
    // defualt height value
  //  @Binding var modalHeight: CGFloat
        var modalHeight : CGFloat = 0
    
    private func onDragEnded(drag: DragGesture.Value) {
        let dragThreshold = modalHeight * (2/3)
        if drag.predictedEndTranslation.height > dragThreshold || drag.translation.height > dragThreshold{
            
          //  authVM.fetchUsers()
            isShown = false
            
        }
    }
    
    
    
    
    var content: () -> Content
    var body: some View {
        
        let drag = DragGesture()
            .updating($dragState) { drag, state, transaction in
                state = .dragging(translation: drag.translation)
        }
        .onEnded(onDragEnded)
        
        return Group {
            
            // Background (Dismissable)
            if dismissableBackground == true {
            ZStack{
                Spacer()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                    .background(isShown ? Color.black.opacity( 0.5 * fraction_progress(lowerLimit: 0, upperLimit: Double(modalHeight), current: Double(dragState.translation.height), inverted: true)) : Color.clear)
                    .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                    .gesture(
                        TapGesture()
                            .onEnded { _ in
                                UIApplication.shared.endEditing()
                                self.isShown = false
                        }
                )
            }
            }
            //Foreground
            VStack{
                Spacer()
                ZStack{
                    Color(bgColor).opacity(bgOpacityLevel)
                        .frame(width: UIScreen.main.bounds.size.width, height:modalHeight)
                        .cornerRadius(16
                        )
                        .shadow(radius: 5)
                    VStack{
                        self.content()
                     //   .padding() // i changed
                    //    .padding(.bottom, 65) // i changed
                        .frame(width: UIScreen.main.bounds.size.width, height:modalHeight)
                        .clipped()
                        if isNear_tabView {
                            Spacer().frame(height:65) //(fix) -- hard coded need to fit all apps
                        }
                    }
                }
                .offset(y: isShown ? ((self.dragState.isDragging && dragState.translation.height >= 1) ? dragState.translation.height : 0) : modalHeight)
                .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                .gesture(drag)
                
                
            }
            .KeyboardAwarePadding()
        }.edgesIgnoringSafeArea(.all)
        
    }
}




// CHECK FOR DRAGGING
enum DragState {
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}

// MEASURES SCROLLABLE MOVEMENT
func fraction_progress(lowerLimit: Double = 0, upperLimit:Double, current:Double, inverted:Bool = false) -> Double{
    var val:Double = 0
    if current >= upperLimit {
        val = 1
    } else if current <= lowerLimit {
        val = 0
    } else {
        val = (current - lowerLimit)/(upperLimit - lowerLimit)
    }
    
    if inverted {
        return (1 - val)
        
    } else {
        return val
    }
    
}


// HIDE THE KEYBOARD
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

//struct HalfModalView_Example_Previews: PreviewProvider {
//    static var previews: some View {
//        DashboardView()
//    }
//}
