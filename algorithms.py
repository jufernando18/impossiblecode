# from functools import reduce
from collections import defaultdict

def addingMangos(mangosByType) :
    # return reduce(lambda accumulator, mangosOfEachType: accumulator + mangosOfEachType, mangosByType)
    return mangosByType[0] + mangosByType[1]
totalMangos = addingMangos([37, 12])
print("Cecilia has ", totalMangos, " mangos")


def walkingAndCounting(inputSteps):
    altitud, valleys = 0, 0
    inputStepsArray = list(map(lambda step: 1 if step == "U" else -1, [*inputSteps]))
    for step in inputStepsArray:
        altitud += step
        if(altitud == 0 and step == 1):
            valleys += 1
    return valleys
totalValleys = walkingAndCounting("UUDUDUUUDDUDUUUUUUDUDDDDUUUDUDUUUDDDDUDDDUUUDDDDDD")
print("The number of valleys in the walk is ", totalValleys)


def calculateCloserDistance(indexes): 
    distances = [abs(b - a) for a, b in zip(indexes, indexes[1:])]
    return min(distances)
def closeTwins(numbers):
    seen = set()
    repeatedNumbers = [number for number in numbers if number in seen or seen.add(number)]
    if len(repeatedNumbers) < 1:
        return -1
    repeatedNumbersWithIndexesUngrouped = [(position, number) for position, number in enumerate(numbers) if number in repeatedNumbers]
    repeatedNumbersWithIndexes = defaultdict(list)
    for position, number in repeatedNumbersWithIndexesUngrouped: repeatedNumbersWithIndexes[number].append(position)
    closerDistances =  list(map(lambda numberIndexes: calculateCloserDistance(numberIndexes[1]), repeatedNumbersWithIndexes.items()))
    return min(closerDistances)
closerDistance = closeTwins([2, 27, 10, 27, 2,2])
print("The minimum distance is ", closerDistance)


def countingSolutions(input):
    target = input[0]
    values = input[1:]
    occurrences = 0
    for position, number in enumerate(values[:-1]):
        for nextNumber in values[position + 1:]:
           if target == abs(number - nextNumber):
                occurrences += 1
    return occurrences
pairsWithTargetDifference = countingSolutions([3, 2, 33, 23, 24, 18, 5, 21, 42, 39, 12])
print("The number of pairs in the list that have difference indicated is ", pairsWithTargetDifference)