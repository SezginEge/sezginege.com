hugo

# TODO: 
# - Check if there is a way to find out which files has been sycned
# aws s3 sync _site/ "s3://$S3_BUCKET_NAME" --size-only --include "*" --delete

aws s3 sync public/ "s3://$S3_BUCKET_NAME" --size-only --exclude "*" --include "*.*" --delete
aws s3 sync public/ "s3://$S3_BUCKET_NAME" --size-only --content-type text/html --exclude "*.*"


# TODO: 
# - Receive path param
# - Receive flag to determine if would like to invalidate cache
aws cloudfront create-invalidation --distribution-id ${CLOUDFRONT_DISTRUBITON_ID} --paths '/*'