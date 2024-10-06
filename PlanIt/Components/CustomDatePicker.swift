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
                HStack(spacing: 10) {
                    Text(extraDate()[1])
                    Text(extraDate()[0])
                }
                .font(.robotoB(16))

                Spacer()

                Button {
                    withAnimation {
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.robotoB(16))
                }
                .buttonStyle(.plain)

                Button {
                    withAnimation {
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.robotoB(16))
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal)

            // Day View...
            HStack(spacing: 0) {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .font(.robotoM(16))
                        .frame(maxWidth: .infinity)
                }
            }
            // Date
            // Lazy Grid..
            let columns = Array(repeating: GridItem(.flexible()), count: 7)

            LazyVGrid(columns: columns) {
                ForEach(extractDate()) { value in
                    CardView(value: value)
                        .background(
                            Circle()
                                .fill(.royalBlue)
                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                        )
                        .onTapGesture {
                            currentDate = value.date
                        }
                }
            }

            Spacer()
        }
        .padding()
        .padding(.top, 50)
    }

    @ViewBuilder
    func CardView(value: DateValue) -> some View {
        VStack {
            if value.day != -1 {
                Text("\(value.day)")
                    .font(.robotoM(16))
                    .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary.opacity(0.7))
                    .frame(maxWidth: .infinity)
            }
        }
        .padding(.vertical, 9)
        .frame(height: 60, alignment: .center)
        .onAppear {
            print("Card for day \(value.day) re-rendered")
        }
    }

    // Checking dates
    func isSameDay(date1: Date, date2: Date) -> Bool {
        Calendar.current.isDate(date1, inSameDayAs: date2)
    }

    // Extraing year and month for display
    func extraDate() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"

        let date = formatter.string(from: getCurrentMonth())

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

        var days = currentMonth.getAllDates().compactMap { date in
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

    private func calculateGridHeight() -> CGFloat {
        let maxWeeks = 7 // Max number of weeks in a month (worst case scenario)
        let rowHeight: CGFloat = 60 // Height of each row (date cells)
        let spacing: CGFloat = 15 // Spacing between rows

        return (rowHeight * CGFloat(maxWeeks)) + (spacing * CGFloat(maxWeeks - 1))
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
        return range!.compactMap { day in
            calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}

struct DateValue: Identifiable {
    var id = UUID()
    var day: Int
    var date: Date
}
