from pymongo import MongoClient

connection = MongoClient("mongodb+srv://admin:GGIJSXEuC6ktz6FU@cluster0.zkh3j9j.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0", tls=True, tlsAllowInvalidCertificates=True)

db = connection.gym_app  
collection_clients = db["clients"]
collection_routines = db["routines"]
collection_exercises = db["exercises"]
collection_users = db["users"]
collection_sesions = db["sesions"]
collection_machines = db["machines"]
collection_exercises_preset = db["exercises_preset"]
collection_laps = db["laps"]
collection_drafts = db["drafts"]
collection_trainers = db["trainers"]




