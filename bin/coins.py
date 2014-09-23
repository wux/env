coins = [1, 3, 4]
table = []
def build_table(value):
  index = 1
  table.append(0)
  while index <= value:
      # todo
      min_cost = value + 1  # never be this big.
      for i in xrange(len(coins)):
          last_coin = coins[i]
          if index < last_coin:
              cost = -1
          elif index == last_coin:
              cost = 0
          else:
              cost = table[index - last_coin]
          if cost >= 0 and cost < min_cost:
              min_cost = cost
      table.append(min_cost + 1)
      index += 1
      print(table)
  return table[-1]        

print(build_table(6))
