You have a payment processing service. Every week, a cron job downloads the payment data for that week and sends it to the finance team. Since it’s Diwali month, your company has decided to give discounts to all users. As most of the developers have already left for the holidays, it’s up to you to implement this new feature. So, you decide to create a quick middleware that runs on the downloaded `payments.txt`.

You now need to create a simple file-processing binary called `discount_processor`, which takes a text file from `stdin`. For example: `./discount_processor < payments.txt`. It should create a new file called `processed_payments.txt` with the same content as the input file but with an extra column, `discount_amount`.

You’ve received a set of instructions from management on how much discount each user should get.

| Payment                                             | Discount |
|-----------------------------------------------------|----------|
| credit_card&nbsp;&nbsp;&nbsp;                       | 5%       |
| debit_card&nbsp;&nbsp;&nbsp;&nbsp;                  | 7%       |
| paypal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;          | 6%       |
| upi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 8%       |
| netbanking&nbsp;&nbsp;                              | 4%       |


**Note** that every permium user gets an additional **5%** discount

### Example `payments.txt` format
```payment.txt
user_id,payment_method,amount,is_premium
user_001,debit_card,708.83,true
user_002,netbanking,829.73,true
user_003,paypal,278.3,false
user_004,upi,71.22,false
```

### Expected `processed_payments.txt` format
```final_payment.txt
user_id,payment_method,amount,is_premium,discount_amount
user_001,debit_card,708.83,true,85.06
user_002,netbanking,829.73,true,74.68
user_003,paypal,278.3,false,16.7
user_004,upi,71.22,false,5.7
```

### Acceptance criteria
- Final binary should be present in `/home/ubuntu`
- Final binary should have executable premissions
- Final binary should be named `discount_processor`
- Processed file should be named `processed_payments.txt`


### Notes
- You have `sudo` access to install packages, eg `sudo apt install vim`
- You are allowed to use any tech stack
