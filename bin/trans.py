#!/usr/bin/python

import copy


class Transaction(object):
  def __init__(self, database):
      self.db = copy.deepcopy(database)

  def set_cmd(self, name, value):
      self.db[name] = value

  def get_cmd(self, name):
      if not name in self.db:
          return "NULL"
      return self.db[name]

  def commit_cmd(self, database):
      database.update(self.db)
      

mem_db = {}
trans_stack = []


def main():
    while True:
        cmd = raw_input(">")
        if cmd == 'END':
            break

        if len(trans_stack) == 0:
            trans = Transaction(mem_db)
            trans_stack.append(trans)
        trans = trans_stack[-1]

        if cmd.startswith('GET'):
            print(trans.get_cmd(cmd.split()[1]))
        elif cmd.startswith('SET'):
            params = cmd.split();
            trans.set_cmd(params[1], params[2])
        elif cmd.startswith('BEGIN'):
            trans_stack.append(Transaction(trans.db))
        elif cmd.startswith('COMMIT'):
            db = mem_db
            if len(trans_stack) > 1:
                db = trans_stack[-2].db;
            trans.commit_cmd(db)
            del trans_stack[-1]
        elif cmd.startswith('ROLLBACK'):
            del trans_stack[-1]
            
        # print(cmd)
    

if __name__ == '__main__':
    main()
