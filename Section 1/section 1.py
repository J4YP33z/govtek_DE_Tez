import pandas as pd
import numpy as np

# project brief:
# Delete any rows which do not have a name
# Split the name field into first_name, and last_name
# Remove any zeros prepended to the price field
# Create a new field named above_100, which is true if the price is strictly greater than 100


df = pd.read_csv("dataset.csv")  # prepended zeroes are removed automatically
df.dropna(subset=["name"], inplace=True)  # delete any rows which do not have a name
df["price"].fillna(0, inplace=True)  # fill zeroes for NaN values

tmp = df["name"].str.split(" ", n=1, expand=True)  # split name
df.drop(columns=["name"], inplace=True)
df["first_name"] = tmp[0]
df["last_name"] = tmp[1]
df = df[["first_name", "last_name", "price"]]  # reorder columns

df["above_100"] = np.where(df["price"] > 100, True, False)  # new col for price > 100

print(df.head())
df.to_csv("processed.csv", index=False)