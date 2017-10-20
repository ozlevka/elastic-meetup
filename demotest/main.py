import json
from google.cloud import storage
from elasticsearch import Elasticsearch



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


blobs = bucket.list_blobs(prefix="meetup/9d393db7")

counter = 0
bulk = []
for blob in blobs:
    counter = counter + 1
    b_data = bucket.get_blob(blob.name)
    tmp = b_data.download_as_string()
    try:  # try parsing to dict
        struct = json.loads(tmp)
        obj = make_bulk_object(struct)
        res = es_client.index('enigmatos', doc_type='test', body=struct)
    except Exception as ex:
        print(ex)
        print("Error in file: {}".format(blob.name))
    else:
        print(res)

    # if len(bulk) >= es_bulk_count:
    #     print(es_client.bulk(bulk))
    #     bulk = []


print('Total count: {}'.format(counter))
