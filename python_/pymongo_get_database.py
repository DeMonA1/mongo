from pymongo import MongoClient


def get_database():
    CONNECTION_STRING = \
    "mongodb://localhost:27017/task"
    
    client = MongoClient(CONNECTION_STRING)
    
    return client['user_shopping_list']

if __name__ == "__main__":
    dbname = get_database()
    