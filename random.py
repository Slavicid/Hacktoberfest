import random

random_numbers = [random.randint(1, 100) for _ in range(10)]

total = sum(random_numbers)

average = total / len(random_numbers)

print("Random Numbers:", random_numbers)
print("Sum:", total)
print("Average:", average)
