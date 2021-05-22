//For loop exercise 2.3
void main() {
	List<String> pets = ['turtle', 'rabbit', 'frog', 'penguin', 'mouse'];
	for (var pet in pets) {
		print(pet);
	}
	
	//Function abstraction 2.4 (refer below function call)
	List<int> nums = [1,2,3,4,5];
	addNumbers(nums);
	
	//Function multiplier 2.4 (refer below function call)
	List<int> smallNums = [1,2,3];
	multipleNumbers(smallNums);
}

//Function abstraction 2.4
void addNumbers(List<int> nums) {
	
	
	int i = 0;
	int sum = 0;
	
	while (i<nums.length){
		sum += nums[i];
		i += 1;
	}
	print(sum);
}

//Function multiplier 2.4 - print 2,4,6
void multipleNumbers(List<int> smallNums) {
	Iterable<int> biggerNums = smallNums.map((int n) => n*2);
	print(biggerNums);
}