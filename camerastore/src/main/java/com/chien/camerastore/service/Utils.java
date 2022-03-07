package com.chien.camerastore.service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Utils {
    public static boolean isValidUsername(String username) {
        Pattern VALID_USERNAME_REGEX = Pattern.compile("^[a-zA-Z0-9]+$",
                Pattern.CASE_INSENSITIVE);
        Matcher matcher = VALID_USERNAME_REGEX.matcher(username);
        if (!matcher.find()) {
            return false;
        }
        return true;
    }

    public static boolean isValidPhoneNumber(String phone) {
        Pattern VALID_PHONE_NUMBER_REGEX = Pattern.compile("(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\\b",
                Pattern.CASE_INSENSITIVE);
        Matcher matcher = VALID_PHONE_NUMBER_REGEX.matcher(phone);
        Pattern VALID_ID_NUMBER_REGEX = Pattern.compile("([0-9]{9,12})\\b", Pattern.CASE_INSENSITIVE);
        Matcher matcher2 = VALID_ID_NUMBER_REGEX.matcher(phone);
        if (!matcher.find() || !matcher2.find()) {
            return false;
        }
        return true;
    }

    public static boolean isValidEmail(String email) {
        Pattern VALID_EMAIL_ADDRESS_REGEX = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$",
                Pattern.CASE_INSENSITIVE);
        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(email);
        if (!matcher.find()) {
            return false;
        }
        return true;
    }
}
