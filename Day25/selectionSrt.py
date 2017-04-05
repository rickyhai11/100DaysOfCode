def slctnSort(lst):
	for fill in range (len(lst)-1,0,-1):
		posOfMax = 0
		for loc in range(1, fill+1):
			if lst[loc]>lst[posOfMax]:
				posOfMax=loc

		temp = lst[fill]
		lst[fill] = lst[posOfMax]
		lst[posOfMax] = temp

lst = [54,26,93,17,77,31,44,55,20]
slctnSort(lst)
print(lst)