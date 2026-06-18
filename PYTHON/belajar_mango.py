### 1. menghubungkan python Flask ke MongoDB

import pymongo
from flask import Flask, render_template
import os #mengimpor modul sistem operasi 
import certifi

MONGODB_URL = "mongodb+srv://rasky:87S3FhYCjz5Sl7Ap@cluster0.syofo28.mongodb.net/?appName=Cluster0&readPreference=secondaryPreferred"

client = pymongo.MongoClient(MONGODB_URL) # buat koneksi (client)
print(client.list_database_names())

app = Flask(__name__)
if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(debug=True, host='0.0.0.0', port=port)

# db = client.belajar_mango #akses / buat database

                                        #masuk ke materi
# OPERASI DASAR (CRUD)                                        

# A. Insert Data 



