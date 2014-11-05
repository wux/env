DNA: AAGATCCGTC
{A, C, T, G}

example: substrings(3): AAG, AGA, GAT, ...

substrings of size 10.
output substrings that appear more than once in sorted order.

int find_duplicated_substr(const char* str, int len) {
  // A --> 0, C --> 1, T --> 2 G-->3 
  // sizeof(int) == 32.
  const int num_substr = 1 << 21;
  unique_ptr<int []> flags(new int[num_substr / 32 + 1]);
  int index = 0;
  for (int i = 0; i < 10; ++i) {
    index <<= 2;
    index += bit_value(str + i);
  }
  int i = 1;
  while (i < len - 10) {
    uint mask = 1 << index % 32;
    // set the flag
    flags[index / 32] &= mask;
    // update the index;
    index &= (1 << 17 - 1);
    index <<= 2;
    index |= bit_value(str + i + 10);
    // check the index if it is set
    ( == flags[index / 32]);
  }
}
