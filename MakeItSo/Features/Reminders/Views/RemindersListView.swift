//
//  ContentView.swift
//  MakeItSo
//
//  Created by Admin on 2/10/24.
//

import SwiftUI


struct RemindersListView: View {
    @State
    private var reminders = Reminder.samples
    @State
    private var isPresentingAddReminder = false
    
    private func addPresentAddReminderView() {
        isPresentingAddReminder.toggle()
    }
    
    
    var body: some View {
        List($reminders) { $reminder in
            HStack {
                Image(systemName: reminder.isCompleted
                      ? "largecircle.fill.circle"
                      : "circle")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .onTapGesture {
                    reminder.isCompleted.toggle()
                }
                Text(reminder.title)
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button(action: addPresentAddReminderView){
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("New Reminder")
                    }
                }
                Spacer()
            }
        }
        .sheet(isPresented: $isPresentingAddReminder) {
            AddReminderView {
                reminder in
                reminders.append(reminder)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RemindersListView()
                .navigationTitle("Reminders")
        }
    }
}
