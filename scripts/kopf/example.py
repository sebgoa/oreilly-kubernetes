import kopf


@kopf.on.create('oreilly.com', 'v1alpha1', 'book')
def create_fn(spec, **kwargs):
    print(f"And here we are! Creating: {spec}")
    return {'message': 'hello world'}  # will be the new status

#@kopf.on.update('oreilly.com', 'v1alpha1', 'book')
#def update_fn(old, new, diff, **kwargs):
#    print('UPDATED')
#    print(f"The following object got updated: {spec}")
#    return {'message': 'updated'}

#@kopf.on.delete('oreilly.com', 'v1alpha1', 'book')
#def delete_fn(metadata, **kwargs):
