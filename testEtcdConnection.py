import etcd3

etcd = etcd3.client(
    host='RANDOM_STRING.databases.appdomain.cloud', 
    port=PORT,
    user='USER',
    password='PASSWORD'
    )

etcd.put('/key', 'dooot')
