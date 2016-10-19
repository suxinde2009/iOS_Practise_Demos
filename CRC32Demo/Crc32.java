public class Crc32 {
    private static long[] crc32Table = new long[256];
 
    static {
        long crcValue;
        for (int i = 0; i < 256; i++) {
            crcValue = i;
            for (int j = 0; j < 8; j++) {
                if ((crcValue & 1) == 1) {
                    crcValue = crcValue >> 1;
                    crcValue = 0x00000000edb88320L ^ crcValue;
                } else {
                    crcValue = crcValue >> 1;
 
                }
            }
            crc32Table[i] = crcValue;
        }
 
    }
 
    public static long getCrc32(byte[] bytes) {
        long resultCrcValue = 0x00000000ffffffffL;
        for (int i = 0; i < bytes.length; i++) {
            int index = (int) ((resultCrcValue ^ bytes[i]) & 0xff);
            resultCrcValue = crc32Table[index] ^ (resultCrcValue >> 8);
        }
        resultCrcValue = resultCrcValue ^ 0x00000000ffffffffL;
        return resultCrcValue;
    }
 
    public static void main(String[] args) {
        String testStr = "sdfdsfdsfdsfdsfdssdfdsfdsfdsfdsssssssssssssfdsfdsfds";//"asfkjfkasdjfkldjfhdjfhasdjkfj;asdkljfk;asdjfcnnd";
        java.util.zip.CRC32 jdkCrc32 = new java.util.zip.CRC32();
        jdkCrc32.update(testStr.getBytes());
        System.out.println("jdk  crc32: " + jdkCrc32.getValue());
        System.out.println("test crc32: " + getCrc32(testStr.getBytes()));
    }
}