import pandas as pd


df = pd.read_csv("airlines_flights_datacsv.csv")

df['stops'] = df['stops'].replace({
    'zero': 'Directo',
    'one': 'Con escalas',
    'two_or_more': 'Con escalas'
})

resumen = df.groupby(['airline', 'stops']).agg(
    min_price=('price', 'min'),
    max_price=('price', 'max'),
    avg_price=('price', 'mean')
).reset_index()

resumen.to_csv("resumen_vuelos.csv", index=False)

print(resumen)

resumen.to_excel("resumen_vuelos.xlsx", index=False)
