import json
import boto3
import os

def lambda_handler(event, context):
    secret_name = os.environ['SECRET_NAME']
    region_name = os.environ['REGION']

    # Initialize clients
    secrets_client = boto3.client('secretsmanager', region_name=region_name)
    dynamodb = boto3.resource('dynamodb', region_name=region_name)
    
    # Retrieve the secret
    secret_value = secrets_client.get_secret_value(SecretId=secret_name)
    secret = json.loads(secret_value['SecretString'])
    
    # Access DynamoDB table
    table = dynamodb.Table('TerraformTasksTable')
    
    # Example operation: Get item with id '123'
    response = table.get_item(Key={'id': '123'})
    item = response.get('Item', {})
    
    return {
        'statusCode': 200,
        'body': json.dumps({
            'message': 'Data retrieved successfully',
            'secret': secret,
            'item': item
        }),
        'headers': {
            'Content-Type': 'application/json'
        }
    }
