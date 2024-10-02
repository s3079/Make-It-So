//
//  AddReminderView.swift
//  MakeItSo
//
//  Created by Admin on 2/10/24.
//

import SwiftUI


struct AddReminderView: View {
  @State
  private var reminder = Reminder(title: "")
    @Environment(\.dismiss)
    private var dismiss
    
    var onCommit: (_ reminder: Reminder) -> Void
    
    private func commit(){
        onCommit(reminder)
        dismiss()
    }


  var body: some View {
      NavigationStack {
            Form {
              TextField("Title", text: $reminder.title)
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: commit) {
                            Text("Add")
                          }
                        }
            }
          }
  }
}


struct AddReminderView_Previews: PreviewProvider {
  static var previews: some View {
      AddReminderView {
          reminder in
          print("You addes a new reminder: \(reminder.title)")
      }
  }
}
