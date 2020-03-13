import pandas as pd
import requests
api_key = "d9c38f1600bbb109904d0e363c145731"

df = pd.read_csv('name_basics.tsv',sep='\t')

# df.iloc[0]['nconst']
imdb_ids = []
name = []
birthday = []
deathday = []
gender = []
unknown = []

for i in range(len(df)):
    imdb_id = df.iloc[i]['nconst']
    response = requests.get("https://api.themoviedb.org/3/find/"+imdb_id+"?api_key=d9c38f1600bbb109904d0e363c145731&language=en-US&external_source=imdb_id")
    res = response.json()
    if len(res['person_results']) == 0:
        unknown.append(imdb_id)
        continue
    id = res['person_results'][0]['id']
    response1 = requests.get("https://api.themoviedb.org/3/person/"+str(id)+"?api_key=d9c38f1600bbb109904d0e363c145731&language=en-US")
    res1 = response1.json()
    imdb_ids.append(imdb_id)
    name.append(res1['name'])
    birthday.append(res1['birthday'])
    deathday.append(res1['deathday'])
    gender.append(res1['gender'])
    count+=1
    # print(i)
#     if count%100000==0:
#         print('.')

list_of_tuples = list(zip(imdb_ids,name, birthday,deathday,gender))  
df1 = pd.DataFrame(list_of_tuples, columns = ['nconst','Name', 'birthDay','deathDay','Gender'])  