package config.passwordEncoder;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordEncode {

    public static String encode(String password) {
        try {
            // SHA-256과 같은 해시 알고리즘을 사용하여 비밀번호를 해싱
            MessageDigest encodePw = MessageDigest.getInstance("SHA-256");
            // 비밀번호를 바이트 배열로 변환한 후 SHA-256 해싱을 적용
            byte[] encodeHash = encodePw.digest(password.getBytes(StandardCharsets.UTF_8));
            // 해싱된 바이트 배열을 16진수 문자열로 변환
            StringBuilder hexString = new StringBuilder(2 * encodeHash.length);
            for (byte hash : encodeHash) {
                // 각 바이트 값을 16진수 문자열로 변환
                // 각 바이트는 8비트(0부터 255까지)를 표현하며,
                // 16진수 문자열로 표시할 때 0부터 F까지의 두 자리 문자열로 변환됩니다.
                String hex = Integer.toHexString(255 & hash);
                // 만약 변환된 16진수 문자열이 한 자리라면,
                // hexString.append('0');를 사용하여 앞에 '0'을 추가하여 두 자리로 맞춥니다.
                if(hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}