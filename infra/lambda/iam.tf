data "aws_iam_policy_document" "lambda_assume_role_policy"{
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ira_performance_notifier_role" {
  name = "ira_performance_notifier_role"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
}
