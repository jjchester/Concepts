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
                Group {
                    Text("What is Grand Central Dispatch?")
                        .font(.title2)
                        .bold()
                        .padding(.bottom)
                    Text(
                    """
                    Grand Central Dispatch, commonly referred to as GCD, is Apple's system-level concurrency framework.
                    
                    It allows developers to take advantage of the multiple cores available on your Apple devices so that computationally expensive operations like network requests and database queries can be done asynchronously, in the background, without blocking user interaction.
                    """)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                }
                Group {
                    HStack {
                        VStack {
                            DispatchBackgroundQueueButtonView()
                            Text("This \"Press Me\" button will execute a 3 second task on a background thread.")
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                        VStack {
                            DispatchMainQueueButtonView()
                            Text("This \"Press Me\" button will execute a 3 second task on the main thread.")
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    
                    Text(
                    """
                    The above example is a simple demonstration of what happens when you execute heavy tasks on background queue vs the main queue.
                    
                    Dispatching to a background queue is easy. All you have to do is wrap whatever you need to execture in the following code:
                    """
                    )
                    .multilineTextAlignment(.leading)
                    
                    CodeBlockView(code:
                        """
                        DispatchQueue.global(qos: .background).async {
                            // Whatever needs to run
                            // in the background
                            DispatchQueue.main.async {
                                // Any UI updates can be dispatched
                                // back to the main queue
                            }
                        }
                        """
                    )
                    .padding(.bottom)
                }
                
                Group {
                    Text("Create Your Own Queue")
                        .font(.title2)
                        .bold()
                        .padding([.top, .bottom])
                    Text(
                        "You can also create your own serial or concurrent queues to work with if you want more control over the queues that you're using.")
                    
                    CodeBlockView(code:
                        """
                        let yourQueueName =
                            DispatchQueue(
                                // String to identify queue
                                label: String,
                                // Execution priority of queue items
                                qos: DispatchQos,
                                // Attritubtes like .concurrent, default is serial
                                attributes: [DispatchQueue.Attributes]
                            )
                        
                        yourQueueName.async {
                            // Execute some async task on your queue
                        }
                        """)
                    Text("Dispatch Groups")
                        .font(.title2)
                        .bold()
                        .padding([.top, .bottom])
                    
                    Text(
                         """
                         Dispatch groups allow you to attach multiple work items to a group so that they can be monitored as a single unit. You enter a group with `.enter()` before executing your task, and exit with `.leave()` when it's complete.
                         
                         Once all tasks in the group have finished, the group calls `.notify()` and is able to execute a completion handler with the guarantee that all work items have completed.
                         """
                    )
                    .fixedSize(horizontal: false, vertical: true)
                    
                    CodeBlockView(code:
                        """
                        let group = DispatchGroup()
                        
                        group.enter()
                        someAsyncTask() {
                            group.leave()
                        }
                        
                        group.enter()
                        someOtherAsyncTask() {
                            group.leave()
                        }
                        
                        group.notify(queue: .main) {
                            // Completion handler
                        }
                        """)
                }
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
