data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${path.root}/../ira-performance-notifier/lambda_handler.py"
  output_path = "ira-performance-notifier.zip"
}

resource "aws_lambda_function" "test_lambda_function" {
        function_name = "ira-performance-notifier-lambda"
        filename      = "ira-performance-notifier.zip"
        source_code_hash = data.archive_file.lambda.output_base64sha256
        role          = aws_iam_role.ira_performance_notifier_role.arn
        runtime       = "python3.13"
        handler       = "lambda_handler.lambda_handler"
        timeout       = 10
}