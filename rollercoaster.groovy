// input = new Scanner(System.in);
input = new Scanner(new File("../input.txt"))

gr = []

places = input.nextInt()
iters = input.nextInt()
groupNum = input.nextInt()

start = 0
end = 0
currentPeople = 0

next = new Tuple[groupNum]

groupNum.times {
    gr += input.nextInt()
    if (end == it && gr[it] + currentPeople <= places) {
        currentPeople += gr[it]
        end++;
    }
}

totalPeople = gr.sum()

if (totalPeople <= places) {
    println totalPeople * iters
    return
}

next[0] = new Tuple(end, currentPeople)

(1..<groupNum).each {
    currentPeople -= gr[it - 1]
    start++;
    while (currentPeople + gr[end] <= places) {
        currentPeople += gr[end]
        end++
        end %= groupNum
    }
    next[it] = new Tuple(end, currentPeople)
}

curS = new long[groupNum]
cur = 0
long res = 0
iters.times {
    res += next[cur][1]
    cur = next[cur][0]

    if (curS[it] == 0) {
        curS[it] = res
    } else {
        loopPrice = cur - curS[it]
    }
}

println res