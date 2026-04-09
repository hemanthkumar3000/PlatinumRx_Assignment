minutes = int(input("Enter minutes: "))

hours = minutes // 60
mins = minutes % 60

if hours == 0:
    print(f"{mins} minutes")
elif hours == 1:
    print(f"{hours} hr {mins} minutes")
else:
    print(f"{hours} hrs {mins} minutes")