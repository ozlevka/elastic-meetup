import json
from google.cloud import storage
from elasticsearch import Elasticsearch
from elasticsearch import helpers as blk
import os



bucket_name = 'enigmatos-data'
es_client = Elasticsearch()
es_bulk_count = 20

def make_bulk_object(data):
    global bulk
    return {
        '_index': 'enigmatos',
        '_type': 'test',
        '_source' : data
    }


storage_client = storage.Client.from_service_account_json("./Enigmatos-468c9c05e0f7.json")


bucket = storage_client.get_bucket(bucket_name)


blobs = bucket.list_blobs(prefix=os.environ["BUCKET"])

counter = 0
bulk = []
for blob in blobs:
    counter = counter + 1
    b_data = bucket.get_blob(blob.name)
    tmp = b_data.download_as_string()
    struct = None
    try:  # try parsing to dict
        struct = json.loads(tmp)
    except Exception as ex:
        print(ex)
        print("Error in file: {}".format(blob.name))

    if not struct is None:
        obj = make_bulk_object(struct)
        bulk.append(obj)
        #res = es_client.index('enigmatos', doc_type='test', body=struct)

    if len(bulk) >= es_bulk_count:
        print(blk.bulk(es_client, bulk))
        bulk = []

if len(bulk) > 0:
    print(blk.bulk(es_client, bulk))


print('Total count: {}'.format(counter))
