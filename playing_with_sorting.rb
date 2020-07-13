# Working with the Ruby sort method

# The Ruby sort method works by comparing elements of a collection using their <=> operator (more about that in a second), using the quicksort algorithm.

# You can also pass it an optional block if you want to do some custom sorting. The block receives two parameters for you to specify how they should be compared. Let us see an example.

# The Ruby sorting operator (<=>)

# Also called the spaceship operator, takes two parameters and returns one of three values.

  # 0 if the two parameters are equal.
    # -1 if the first parameter is less than the second parameter.
    # 1 if the first parameter is greater than the second parameter.

# Note that when the result is 0, the order of the elements is unpredictable.
# Sort vs. sort_by

# The difference between sort and sort_by is in the parameters to the block.

# sort receives two objects that you have to compare using their <=> operator.

# sort_by receives just one object, and you have to call a method that will be used to map over the collection. If that sounds confusing, you’re not alone. So let us see an example.

# Without a block, sort_by returns an enumerator.

# When you are dealing with larger collections, sort_by is usually what you want to use.

# The chars method returns an array of characters. So you can just sort that array, and then join the elements back into a string.

# Often you want to sort a Hash just like you sort an Array. A hash is a list of key/value pairs. And it also includes the Enumerable module.

#And if you want to sort it by value, it’s just as easy my_hash.sort_by { |k, v| v }.

# As you can see, the result is not a Hash. It’s a two dimensional Array.

# If you want to turn it into a hash, you can call to_h on it.
