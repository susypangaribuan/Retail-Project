# Retail-Project

On a retail website, the following discounts apply: 
1.      If the user is an employee of the store, he gets a 30% discount 
2.      If the user is an affiliate of the store, he gets a 10% discount 
3.      If the user has been a customer for over 2 years, he gets a 5% discount. 
4.      For every $100 on the bill, there would be a $5 discount (e.g. for $990, you get $45 as a discount). 
5.      The percentage based discounts do not apply on groceries. 
6.      A user can get only one of the percentage based discounts on a bill. 
7.      Write a program with test cases such that given a bill, it finds the net payable amount

List of services : 
1.localhost:8080/retail/get-purchase
2.localhost:8080/retail/save-purchase
 you can see the master data in sql dump. 

here the json format :
{
	"user":{
		"id":4
	},
	"detail":[
		{
			"goods":{
				
				"id":1
			}
		},
		{
			"goods":{
				
				"id":2
			}
		},
		{
			"goods":{
				
				"id":4
			}
		},
		{
			"goods":{
				
				"id":5
			}
		}]
}

