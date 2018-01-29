# HOMEWORK 1
# CSC 335-01 Spring 2018
# Nick Frogley 1/29/18

import random

def GCD_consecutive_int(m, n) :
    
    if m > n :
        m, n = n, m

    if m == 0 :
        return 0, 1

    divisor = m
    checks = 1

    while (m % divisor != 0 or n % divisor != 0) and divisor > 0 :
        divisor -= 1
        checks += 1
        
    return divisor, checks

def GCD_euclid(m, n) :

    checks = 1
    
    while (n != 0) :
        r = m % n
        m = n
        n = r
        checks += 1
        
    return m, checks

random_numbers = list()
for i in range(200) :
    random_numbers.append(random.randint(5000,50001))

checks_list = list()
min_checks = (max(random_numbers), 0, 0)     # format: (number of iterations, index for first number of pair, GCD for that pair)
max_checks = (0, 0, 0)

for i in range(0, 200, 2) :

    gcd, checks = GCD_consecutive_int(random_numbers[i], random_numbers[i+1])
    checks_list.append(checks)

    if checks > max_checks[0] :
        max_checks = (checks, i, gcd)

    if checks < min_checks[0] :
        min_checks = (checks, i, gcd)
    
    #gcd_str = "GCD(" + str(random_numbers[i]) + ", " + str(random_numbers[i+1]) + "): "
    #print(gcd_str + str(gcd) + " | checks: " + str(checks))

print("USING CONSECUTIVE INTEGER CHECKING")
print("The most number of iterations used is " + str(max_checks[0]) + " for GCD(" + str(random_numbers[max_checks[1]]) + ", " + str(random_numbers[max_checks[1] + 1]) + ") = " + str(max_checks[2]))
print("The least number of iterations used is " + str(min_checks[0]) + " for GCD(" + str(random_numbers[min_checks[1]]) + ", " + str(random_numbers[min_checks[1] + 1]) + ") = " + str(min_checks[2]))
print("The average number of iterations used for all 100 pairs is " + str(sum(checks_list)/100))

checks_list = list()
min_checks = (max(random_numbers), 0, 0)     # format: (number of iterations, index for first number of pair, GCD for that pair)
max_checks = (0, 0, 0)

for i in range(0, 200, 2) :

    gcd, checks = GCD_euclid(random_numbers[i], random_numbers[i+1])
    checks_list.append(checks)

    if checks > max_checks[0] :
        max_checks = (checks, i, gcd)

    if checks < min_checks[0] :
        min_checks = (checks, i, gcd)
    
    #gcd_str = "GCD(" + str(random_numbers[i]) + ", " + str(random_numbers[i+1]) + "): "
    #print(gcd_str + str(gcd) + " | checks: " + str(checks))

print("USING EUCLID'S ALGORITHM")
print("The most number of iterations used is " + str(max_checks[0]) + " for GCD(" + str(random_numbers[max_checks[1]]) + ", " + str(random_numbers[max_checks[1] + 1]) + ") = " + str(max_checks[2]))
print("The least number of iterations used is " + str(min_checks[0]) + " for GCD(" + str(random_numbers[min_checks[1]]) + ", " + str(random_numbers[min_checks[1] + 1]) + ") = " + str(min_checks[2]))
print("The average number of iterations used for all 100 pairs is " + str(sum(checks_list)/100))

