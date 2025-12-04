# IAM Role for Jenkins to push to ECR + ECS
resource "aws_iam_role" "jenkins_role" {

  name = "jenkins-ci-role"
 
  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Principal = {

          Service = "ec2.amazonaws.com"

        }

        Action = "sts:AssumeRole"

      }

    ]

  })

}
 


# IAM Policy for ECR Full Access


 
resource "aws_iam_policy" "ecr_access_policy" {

  name = "jenkins-ecr-policy"
 
  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Action = [

          "ecr:GetAuthorizationToken",

          "ecr:BatchCheckLayerAvailability",

          "ecr:BatchGetImage",

          "ecr:PutImage",

          "ecr:InitiateLayerUpload",

          "ecr:UploadLayerPart",

          "ecr:CompleteLayerUpload"

        ]

        Effect   = "Allow"

        Resource = "*"

      }

    ]

  })

}
 


# Attach policy to role

 
resource "aws_iam_role_policy_attachment" "jenkins_ecr_attach" {

  role       = aws_iam_role.jenkins_role.name

  policy_arn = aws_iam_policy.ecr_access_policy.arn

}
 


# IAM Instance Profile for EC2

resource "aws_iam_instance_profile" "jenkins_instance_profile" {

  name = "jenkins-instance-profile"

  role = aws_iam_role.jenkins_role.name

}

 