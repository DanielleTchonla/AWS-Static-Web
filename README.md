
# Static Website Deployment with AWS S3, CodePipeline, and CloudFront

## Overview

This project demonstrates the deployment of a static website using AWS services, including Amazon S3, CodePipeline, and CloudFront. The website is hosted on S3 and is automatically deployed whenever changes are pushed to the CodeCommit repository. CloudFront is used as a CDN to ensure fast and secure content delivery.

## Setup

1. **AWS Account**: You will need an AWS account to deploy the website. If you don't have one, sign up at [aws.amazon.com](https://aws.amazon.com/).

2. **Configuration**: Update the Terraform configuration files (`main.tf`, `variables.tf`, etc.) to specify your S3 bucket name, website files, CloudFront settings, and any other required configurations.

3. **Deploy Infrastructure**: Run `terraform apply` to provision the S3 bucket, configure website hosting, and set up the CloudFront distribution.

4. **Upload Website Files**: Upload your website files (HTML, CSS, JavaScript, etc.) to the CodeCommit repository. Any changes pushed to the repository will trigger automatic deployments through CodePipeline.

## Usage

- **Local Development**: Modify your website files locally and push changes to the CodeCommit repository. CodePipeline will automatically deploy the changes to the S3 bucket.
- **Monitoring**: Monitor website performance, usage, and any error logs through AWS CloudWatch or other monitoring tools.

## Security

- **Access Control**: Ensure that access to the S3 bucket and CloudFront distribution is properly secured using IAM policies and bucket policies.
- **SSL/TLS Encryption**: Enable SSL/TLS encryption for your website to ensure secure communication between clients and CloudFront.

## Cost Management

- **Cost Monitoring**: Monitor your AWS billing dashboard to track costs associated with S3 storage, data transfer, CloudFront distribution, and CodePipeline usage.
- **Cost Optimization**: Utilize AWS cost optimization best practices to minimize costs, such as leveraging caching strategies and optimizing CodePipeline configurations.

## Resources

- [AWS Documentation](https://docs.aws.amazon.com/)
- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [AWS CodePipeline Documentation](https://docs.aws.amazon.com/codepipeline/)
- [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)

## Support

For any issues or questions, please contact me at tchonladanielle@gmail.com.

