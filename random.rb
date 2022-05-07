group = %w{ A B C D E F }.shuffle

separate_at = rand(2..4)

p group.slice( 0, separate_at ).sort
p group.slice( separate_at, group.length ).sort
