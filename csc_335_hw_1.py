import random

def GCD_consecutive_int(m, n) :
    
    if m > n :
        m, n = n, m

    if m == 0 :
        return 0

    divisor = m
    checks = 1

    while (m % divisor != 0 or n % divisor != 0) and divisor > 0 :
        divisor -= 1
        checks += 1
        
    return divisor, checks

random_numbers = list()
for i in range(200) :
    random_numbers.append(random.randint(5000,50001))
#print (random_numbers)

#for number in random_numbers:
    
print (GCD_consecutive_int(60, 25))
