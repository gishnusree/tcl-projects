set a 10
set b 15

# Perform addition
set sum [expr {$a + $b}]

# Display result
puts "Sum of $a and $b is: $sum"

# Demonstrate a small loop
puts "Incrementing sum:"
for {set i 0} {$i < 5} {incr i} {
    set sum [expr {$sum + 1}]
    puts "After increment $i: $sum"
}
