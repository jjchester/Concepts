//
//  GCDView.swift
//  Concepts
//
//  Created by Justin Chester on 2023-07-03.
//

import SwiftUI

struct GCDView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont.systemFont(ofSize: 24)]
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Text("What is Grand Central Dispatch?")
                    .font(.title2)
                    .bold()
                    .padding(.bottom)
                Text(
                """
                Grand Central Dispatch, commonly referred to as GCD, is Apple's system-level concurrency library.
                It allows developers to take advantage of the multiple cores available on your Apple devices so that heavy operations like network requests and database queries can be done asynchronously, in the background, without blocking user interaction.
                """)
                .multilineTextAlignment(.leading)
                
                HStack {
                    VStack {
                        DispatchBackgroundQueueButtonView()
                        Text("This button will execute a 3 second task on a background thread.")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack {
                        DispatchMainQueueButtonView()
                        Text("This button will execute a 3 second task on the main thread.")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                
                Text(
                """
                The above example is a simple demonstration of what happens when you execute heavy tasks on background threads vs the main thread.
                Since the main thread is responsible for handling UI interaction, if you task it with something that takes a noticable amount of time, your app will become unresponsive.
                """
                )
                .multilineTextAlignment(.leading)
                
                Text("Dispatch Groups")
                    .font(.title2)
                    .bold()
                    .padding([.top, .bottom])
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
        }
    }
}

struct GCDView_Previews: PreviewProvider {
    static var previews: some View {
        GCDView()
    }
}
