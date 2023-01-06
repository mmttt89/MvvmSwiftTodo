//
//  NoItemsView.swift
//  TodoMvvmSwiftUI
//
//  Created by Mehdi Taghdisi on 10/16/1401 AP.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var screenAnimate: Bool = false
    let secondaryAccentColor: Color = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .font(.title)
                    .fontWeight(.semibold)
                Text("you can add items with clicking on button bellow to start. Remember if you dont i will hunte you for the rest of your life. 😈")
                    .padding(.bottom , 20)
                NavigationLink(destination: AddView(), label: {
                    Text("Tap to add")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height:55).frame(maxWidth: .infinity)
                        .background(screenAnimate ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                })
                .padding(.horizontal, screenAnimate ? 30: 50)
                .shadow(
                    color: screenAnimate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: screenAnimate ? 30 : 10,
                    x:0,
                    y:screenAnimate ?50 :30
                )
                .scaleEffect(screenAnimate ? 1.1 : 1.0)
                .offset(y: screenAnimate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(30)
            .onAppear {
                addAnimation()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !screenAnimate else { return}
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                Animation.easeInOut(duration: 2.0).repeatForever()
            ){
                screenAnimate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemsView()
                .navigationTitle("random title")
        }
    }
}
