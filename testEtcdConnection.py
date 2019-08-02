import etcd3

etcd = etcd3.client(
    host='RANDOM_STRING.databases.appdomain.cloud', 
    port=32038,
    user='USER',
    password='PASSWORD'
    )

etcd.put('/key', 'dooot')
