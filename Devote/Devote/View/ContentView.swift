//
//  ContentView.swift
//  Devote
//
//  Created by Jon Olivet on 2/27/25.
//

import SwiftUI
import CoreData

struct ContentView: View {

    // MARK: - PROPERTY

    @State var task: String = ""

    private var isButtonDisabled: Bool {
        task.isEmpty
    }

    // FETCHING DATA
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)

    private var items: FetchedResults<Item>

    // MARK: - FUNCTION
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }

            task = ""
            hideKeyboard()
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 16) {
                    TextField("New Task", text: $task)
                        .padding()
                        .background(
                            Color(UIColor.systemGray6)
                        )
                        .cornerRadius(10)

                    Button {
                        addItem()
                    } label: {
                        Spacer()
                        Text("Save")
                        Spacer()
                    }
                    .disabled(isButtonDisabled)
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(isButtonDisabled ? Color.gray : Color.pink)
                    .cornerRadius(10)
                } //: VSTACK
                .padding(16)
                List {
                    ForEach(items) { item in
                        VStack(alignment: .leading) {
                            Text(item.task ?? "")
                                .font(.headline)
                                .fontWeight(.bold)

                            Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        } //: LIST ITEM
                    }
                    .onDelete(perform: deleteItems)
                } //: LIST
            } //: VSTACK
            .navigationBarTitle("Daily Tasks", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            } //: TOOLBAR
        } //: NAVIGATION
        Text("Select an item")
    }
}

// MARK: - PREVIEW
#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
