fn calculate_payoff_time(principal: Float64, annual_interest_rate: Float64, monthly_payment: Float64) -> Int:
    var monthly_interest_rate: Float64 = (annual_interest_rate / 100.0) / 12.0
    var current_balance: Float64 = principal
    var months: Int = 0
    var interest: Float64 = 0.0

    # Check if the payment is sufficient to cover the interest
    if monthly_payment <= current_balance * monthly_interest_rate:
        print("Monthly payment is too low to cover the interest. The debt will never be paid off.")
        return -1  # Indicates infinite time to payoff

    while current_balance > 0.0:
        interest = current_balance * monthly_interest_rate
        current_balance += interest
        current_balance -= monthly_payment
        months += 1
        
        # Safety break to avoid infinite loops
        if months > 1000:
            break

    return months

fn main():
    print("Debt Payoff Timeline Calculator")

    # Hardcoded values for testing
    var principal: Float64 = 100000000000.0  # Example principal amount
    var annual_interest_rate: Float64 = 5.0  # Example annual interest rate as a percentage
    var monthly_payment: Float64 = 200.0  # Example monthly payment

    var months: Int = calculate_payoff_time(principal, annual_interest_rate, monthly_payment)

    if months > 0:
        print("It will take " + str(months) + " months to pay off the debt.")
    else:
        print("Debt cannot be paid off with the provided payment amount.")