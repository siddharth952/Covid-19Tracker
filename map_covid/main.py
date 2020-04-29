import geopandas as gpd
import pandas as pd
import matplotlib.pyplot as plt
import requests


location = []
cases = []
deaths = []
recovered = []
url = 'https://api.rootnet.in/covid19-in/stats/latest'
response = requests.get(url)
data = response.json()

for reg_data in data['data']['regional']:
    location.append(reg_data['loc'])
    cases.append(reg_data['totalConfirmed'])
    deaths.append(reg_data['deaths'])
    recovered.append(reg_data['discharged'])

location[0] = 'Andaman & Nicobar Island'
location[2] = 'Arunanchal Pradesh'
location[7] = 'NCT of Delhi'
location[12] = 'Jammu & Kashmir'
location[27] = 'Telangana'

data = [location, cases, recovered, deaths]


def plot_data(dataframe, title, column):
    filename = title + '.png'
    fig, ax = plt.subplots(1, figsize=(10, 6))
    ax.axis('off')
    ax.set_title(title, fontdict={'fontsize': '25', 'fontweight' : '3'})
    dataframe.plot(column=column, cmap='YlOrRd', linewidth=0.8, ax=ax, edgecolor='0.8', legend=True)
    fig.savefig(filename)

cases = pd.DataFrame(list(zip(data[0], data[1])), 
               columns =['states', 'cases'])
recovered = pd.DataFrame(list(zip(data[0], data[2])), 
               columns =['states', 'recovered'])
deaths = pd.DataFrame(list(zip(data[0], data[3])), 
               columns =['states', 'deaths'])

fp = "Igismap/Indian_States.shp"
map_df = gpd.read_file(fp)

merged_cases = map_df.set_index('st_nm').join(cases.set_index('states'))
merged_recovered = map_df.set_index('st_nm').join(recovered.set_index('states'))
merged_deaths = map_df.set_index('st_nm').join(deaths.set_index('states'))


plot_data(merged_cases, 'Covid 19 Cases', 'cases')
plot_data(merged_recovered, 'Covid 19 Recovered', 'recovered')
plot_data(merged_deaths, 'Covid 19 Deaths', 'deaths')