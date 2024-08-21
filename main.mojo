# main.mojo

fn calculate_payoff_time(principal: Float64, annual_interest_rate: Float64, monthly_payment: Float64) -> Int:
    monthly_interest_rate = (annual_interest_rate / 100.0) / 12.0
    current_balance = principal
    months = 0

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
    
    principal = Float64(input("Enter the principal amount: ").strip())
    annual_interest_rate = Float64(input("Enter the annual interest rate (as a percentage): ").strip())
    monthly_payment = Float64(input("Enter the monthly payment: ").strip())

    months = calculate_payoff_time(principal, annual_interest_rate, monthly_payment)
    
    if months > 0:
        print(f"It will take {months} months to pay off the debt.")
    else:
        print("Debt cannot be paid off with the provided payment amount.")

