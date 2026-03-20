import boto3
import time
import io

# Setup client
s3 = boto3.client('s3', endpoint_url='http://localhost:4566', aws_access_key_id='test', aws_secret_access_key='test')
bucket = 'benchmark-bucket'
s3.create_bucket(Bucket=bucket)

# 10MB test data
data = b'0' * 10 * 1024 * 1024 

def benchmark_upload():
    start = time.perf_counter()
    s3.put_object(Bucket=bucket, Key='test-file', Body=data)
    end = time.perf_counter()
    print(f"Upload: {10 / (end - start):.2f} MB/s")

def benchmark_download():
    start = time.perf_counter()
    s3.get_object(Bucket=bucket, Key='test-file')
    end = time.perf_counter()
    print(f"Download: {10 / (end - start):.2f} MB/s")

benchmark_upload()
benchmark_download()