import threading
import pandas as pd
import requests

#api_key = "7dc0ee3c5914a41ff35a15d738de3532"
api_key = "fa6182dc38556b7e84751c8d856de27c"
df = pd.read_csv('../dataset/namebasicsdata.tsv',sep='\t')
# 10000 threads 
def thread_function(id):
	print(id)
	imdb_ids = []
	name = []
	birthday = []
	deathday = []
	gender = []
	#1000*(id-1)+1,1000*id
	for i in range(1000*(id-1)+1,1000*id+1):
		if i>=len(df) :
			break
		print(i)
		imdb_id = df.iloc[i]['nconst']
		response = requests.get("https://api.themoviedb.org/3/find/"+imdb_id+"?api_key="+api_key+"&language=en-US&external_source=imdb_id")
		res = response.json()
		if len(res['person_results']) == 0:
			continue
		id = res['person_results'][0]['id']
		response1 = requests.get("https://api.themoviedb.org/3/person/"+str(id)+"?api_key="+api_key+"&language=en-US")
		res1 = response1.json()
		imdb_ids.append(imdb_id)
		name.append(res1['name'])
		birthday.append(res1['birthday'])
		deathday.append(res1['deathday'])
		gender.append(res1['gender'])
	list_of_tuples = list(zip(imdb_ids,name, birthday,deathday,gender))  
	df1 = pd.DataFrame(list_of_tuples, columns = ['nconst','Name', 'birthDay','deathDay','Gender'])
	print(df1.head())  
	df1.to_csv('personData/id'+str(id)+'.csv')

def main():
	threads = list()
	for index in range(1,10001):
		x = threading.Thread(target=thread_function, args=(index,))
		threads.append(x)
		x.start()
	for index, thread in enumerate(threads):
		thread.join()
	
main()
