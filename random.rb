group = %w{ A B C D E F }.shuffle

index = rand(2..4)

p group.slice( 0, index ).sort
p group.slice( index, group.length ).sort
