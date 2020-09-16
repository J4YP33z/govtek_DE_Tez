# Section 1

## Files
- crontab: schedules "section 1.py" to run at 1:01am everyday
- dataset.csv: raw data
- processed.csv: processed data
- requirements.txt: for use with pip to install python libs
- "section 1.py": ETL script

## Installation
Use the package manager [pip] to install required libs

```bash
pip install -r requirements.txt
```

## Explanation
1. Read dataset.csv into a pandas dataframe. prepended zeroes in the price column are removed automatically in this step
2. Use dropna function to remove any rows with blank names
3. Use fillna function to replace null values with 0
4. Use split function to split name into first and last
5. drop unnecessary name column
6. add first and last name columns and then reorder for presentation purposes
7. add "above_100" column using np.where to decide if the boolean value
8. write the processed csv file