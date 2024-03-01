//
//  VIPTeamView.swift
//  ARLibrary
//
//  Created by Brayton Lordianto on 12/9/22.
//

import SwiftUI

// the purpose of this view
// 1. Contact Page
// 2. Learn About VIP
// 3. Notable Members

struct VIPTeamView: View {
    
    @State private var reviewText = ""
    @State private var isSubmitting = false
    
    var body: some View {
        ZStack {
      
            Color("NYU_purple")
                .frame(height: 64)
                .offset(y:-408)
            .zIndex(1)

            
            Form {
                Section() {
                    
                    Text("Support Center")  .font(.custom("Helvetica-Bold", size: 20))
                        .bold()
                        .foregroundColor(.black)
                        .font(.title)
                    
                    Text("Contact us and leave a review or let us know if there are any issues")
                        .listRowSeparator(.hidden)
                    
                    if let url = URL(string: "https://docs.google.com/forms/d/1AzXmAHnlnq-Lz6Fg4ihssULrMqjiN8FLhrNw4I-xsIU/viewform?edit_requested=true") {
                        Link("Link to Support Page", destination: url).listRowSeparator(.hidden)
                    }
                    
                    
                    HStack {
                        ZStack(alignment: .topLeading) {
                            if reviewText.isEmpty {
                                Text("Leave a review or let us know if there are any issues")
                                    .foregroundColor(.gray)
                                    .font(.custom("Inria Serif", size: 14)).italic()
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 5)
                            }
                            
                            TextEditor(text: $reviewText)
                                .frame(height: 55)
                                .foregroundColor(.gray)
                                .padding(.horizontal, 5)
                                .background(
                                    RoundedRectangle(cornerRadius: 18)
                                        .fill(Color.gray.opacity(0.2)) //
                                )
                        }
                        .frame(maxWidth: .infinity)
                        //
                        
                        Button(action: {
               
                            submitForm()
                        }) {
                            Text("Submit")
                                .foregroundColor(.white)
                                .font(.custom("Inria Serif", size: 14))
                                .padding(.vertical, 15)
                                .frame(width:55)
                                .background(Color("NYU_purple"))
                                .cornerRadius(10)
                        }
                        .disabled(isSubmitting)
                        .opacity(isSubmitting ? 0.5 : 1)
                    }
                    
                    
                    
                    Text("Frequently asked questions").font(.custom("Helvetica-Bold", size: 20))
                        .bold()
                        .listRowSeparator(.hidden)
                    
                    Text(frequentlyAskedQuestions).padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .font(.custom("Inria Serif", size: 14))
                        .listRowSeparator(.hidden)
                        .foregroundColor(.black)
                    
                        .background(
                            RoundedRectangle(cornerRadius: 18) // Apply rounded corners
                                .fill(Color.gray.opacity(0.2)) // Set the background color to gray
                        )
                    //
                    
                    //                if let url = URL(string: "https://engineering.nyu.edu/research-innovation/student-research/vertically-integrated-projects/vip-teams/augmented-library") {
                    //                    Link("Learn More About Us!", destination: url)
                    //                }
                    //
                    Text("Learn more about us").font(.custom("Helvetica-Bold", size: 20))
                        .bold()
                        .listRowSeparator(.hidden)
                    
                    Text(teamMembers)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .font(.custom("Inria Serif", size: 14))
                        .listRowSeparator(.hidden)
                        .foregroundColor(.black)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 18) // Apply rounded corners
                                .fill(Color.gray.opacity(0.2)) // Set the background color to gray
                        )
                    //
                    //                Text("Professor Matthew Frankel - Supervisor")
                    //                    .italic().listRowSeparator(.hidden)
                    
                    //                Text("More Features Coming Soon")
                    //                    .bold()
                    //                    .italic()
                    Text("@2023 - Created by Augmented Library Vertically integrated Project Team, New York University")
                        .font(.caption2).multilineTextAlignment(.center)
                    
                    //
                }
                
            }
            .padding(.top,25)
            .padding(.horizontal,-15)
            .ignoresSafeArea()
            
        }
    }
    
    private func submitForm() {
        // Perform form submission logic here
        
        // Set isSubmitting to true to disable the submit button temporarily
        isSubmitting = true
        
        // Simulate a delay before resetting the form and enabling the submit button again
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // Reset form fields
            reviewText = ""
            
            // Enable the submit button
            isSubmitting = false
        }
    }
    
}

let teamMembers = """
Brayton Lordianto - Lead Developer
Stacey Lee - Lead Project Manager
Alisha Goel - Lead Designer
Emery Bosch - Developer
Thaison Le - Support
Professor Matthew Frankel - Supervisor
"""


let frequentlyAskedQuestions = """
What is augmented reality (AR)?
Overview of the library's functionality
Platforms that the library is compatible with
Main features and capabilities
"""




struct VIPTeamView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VIPTeamView()
        }
    }
}
