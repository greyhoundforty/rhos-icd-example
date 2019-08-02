import etcd3

etcd = etcd3.client(
    host='0efd26ef-eed7-4c90-81c8-f3573736cb58.66c11f9786bc40cfa3a0086f6582f2e7.databases.appdomain.cloud', 
    port=32038,
    user='root',
    password='41118b10b36c2283fd81f0d2543cea9a'
    )

etcd.put('/key', 'dooot')