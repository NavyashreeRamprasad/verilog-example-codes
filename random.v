module random_sequence;
  integer arr[0:9];
  integer rand_val, duplicate, i, j;

  initial begin
    i = 0;
    while (i < 10) begin
      rand_val = $urandom_range(1,10); // random number 1-10

      // Check for duplicate
      duplicate = 0;
      for (j = 0; j < i; j = j + 1)
        if (arr[j] == rand_val) duplicate = 1;

      // Only add if not duplicate
      if (!duplicate) begin
        arr[i] = rand_val;
        i = i + 1;
      end
    end

    // Display
    $write("Random sequence: ");
    for (i = 0; i < 10; i = i + 1)
      $write("%0d ", arr[i]);
    $display("");
  end
endmodule
