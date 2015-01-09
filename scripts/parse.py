

def process_log(fname):
    f = open(fname)
    threads = {}
    for line in f.readlines():
        if "fcrCvmReadData" in line:
            split = line.split()
            r = {}
            r['time'] = split[3]
            r['tag'] = split[4][4:9]
            for item in split[5:]:
                r[item.split('=')[0]] = item.split('=')[1]

            if r['TID'] not in threads:
                threads[r['TID']] = []
            threads[r['TID']].append(r)
    f.close()
    return threads


def print_fields(threads):
    for k in threads:
        #    print(k)
        total = 0
        newlist = sorted(threads[k], key=lambda k: k['time']) 
        for l in newlist:
            print("%s, %s, %s, %s" % (l['max'], l['avg'], l['min'], l['total']))
            total += float(l['total'])
        #print(total)
    return 

def print_nomax(threads):
    total = 0
    for k in threads:
        newlist = sorted(threads[k], key=lambda k: k['time']) 
        for l in newlist:
            count = int(l['count'])
            nomax = float(l['total']) - float(l['max'])
            new_avg = nomax / float(count - 1)
            total += float(l['total'])
            print("%s, %s, %s, %s, %f" % (l['max'], l['avg'], l['min'], l['total'], new_avg))
        #print(total)
    return total

def print_rate(threads, limit):
    count = 0
    total = 0
    for k in threads:
        newlist = sorted(threads[k], key=lambda k: k['time']) 
        for l in newlist:
            total += 1
            if float(l['max']) > float(l['avg']) + limit:
                count += 1
    print("%f %%" % ( count / float(total)))
    return 


mypath = "/Users/jameswu/140900_PaddleTiming/TrainingLogs"
files = [ "%s/stderr_%dG" % (mypath, f) for f in [10, 40, 70] ]
for f in files:
    threads = process_log(f)
    print("# -----" + f)
    total = print_nomax(threads)
    print("# -----" + f + " total time %f" % total)

print_rates = """
    for limit in range(100):
        print_rate(threads, limit)
    for i in range(100):
        print('0')
"""
