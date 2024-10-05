//
//  CustomDatePicker.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-10-05.
//

import SwiftUI

struct CustomDatePicker: View {
    @Binding var currentDate: Date
    @State var currentMonth: Int = 0

    var body: some View {
        VStack(spacing: 35) {
            // Days
            let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    Text(extraDate()[1])
                        .font(.title.bold())
                }

                Spacer()

                Button {
                    withAnimation {
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }

                Button {
                    withAnimation {
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }
            .padding(.horizontal)

            // Day View...
            HStack(spacing: 0) {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }

            // Date
            // Lazy Grid..
            let columns = Array(repeating: GridItem(.flexible()), count: 7)

            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(extractDate()) { value in
                    CardView(value: value)
                        .background(
                            Capsule()
                                .fill(Color("Pink"))
                                .padding(.horizontal, 8)
                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                        )
                        .onTapGesture {
                            currentDate = value.date
                        }
                }
            }
        }
        .onChange(of: currentMonth) { _ in
            // update month
            currentDate = getCurrentMonth()
        }
    }

    @ViewBuilder
    func CardView(value: DateValue) -> some View {
        VStack {
            if value.day != -1 {
                Text("\(value.day)")
                    .font(.title3.bold())
                    .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
                    .frame(maxWidth: .infinity)

                Spacer()
            }
        }
        .padding(.vertical, 9)
        .frame(height: 60, alignment: .top)
    }

    // Checking dates
    func isSameDay(date1: Date, date2: Date) -> Bool {
        Calendar.current.isDate(date1, inSameDayAs: date2)
    }

    // Extraing year and month for display
    func extraDate() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"

        let date = formatter.string(from: currentDate)

        return date.components(separatedBy: " ")
    }

    func getCurrentMonth() -> Date {
        let calendar = Calendar.current

        // Getting Current month date
        guard let currentMonth = calendar.date(byAdding: .month, value: currentMonth, to: Date()) else {
            return Date()
        }

        return currentMonth
    }

    func extractDate() -> [DateValue] {
        let calendar = Calendar.current

        // Getting Current month date
        let currentMonth = getCurrentMonth()

        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            let dateValue = DateValue(day: day, date: date)
            return dateValue
        }

        // adding offset days to get exact week day...
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())

        for _ in 0 ..< firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }

        return days
    }
}

#Preview {
    CustomDatePicker(currentDate: .constant(Date()))
}

extension Date {
    func getAllDates() -> [Date] {
        let calendar = Calendar.current

        // geting start date
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!

        let range = calendar.range(of: .day, in: .month, for: startDate)

        // getting date...
        return range!.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}

struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
