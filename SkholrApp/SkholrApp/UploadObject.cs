using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Amazon.S3;
using Amazon.S3.Model;

namespace SkholrApp
{
    public class UploadObject
    {
      

        static IAmazonS3 client;

        public static int WritingAnObject(string filename, string absFilePath)
        {
            string bucketName = "skholrpdfdocs";
            string filePath = absFilePath;
            string keyName = filename;

            using (client = new AmazonS3Client(Amazon.RegionEndpoint.USEast1))
            {
                Console.WriteLine("Uploading an object");
                try
                {
                    PutObjectRequest putRequest2 = new PutObjectRequest
                    {
                        BucketName = bucketName,
                        Key = keyName,
                        FilePath = filePath,
                        ContentType = "application/pdf"
                    };
                    putRequest2.Metadata.Add("x-amz-meta-title", "someTitle");

                    PutObjectResponse response2 = client.PutObject(putRequest2);

                    return 1;
                }
                catch (AmazonS3Exception amazonS3Exception)
                {
                    if (amazonS3Exception.ErrorCode != null &&
                        (amazonS3Exception.ErrorCode.Equals("InvalidAccessKeyId")
                        ||
                        amazonS3Exception.ErrorCode.Equals("InvalidSecurity")))
                    {
                        Console.WriteLine("Check the provided AWS Credentials.");
                        Console.WriteLine(
                            "For service sign up go to http://aws.amazon.com/s3");
                    }
                    else
                    {
                        Console.WriteLine(
                            "Error occurred. Message:'{0}' when writing an object"
                            , amazonS3Exception.Message);
                    }

                    return 0;
                }
            }
        }
    }
}