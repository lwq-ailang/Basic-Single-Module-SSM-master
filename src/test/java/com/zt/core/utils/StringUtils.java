package com.zt.core.utils;

import java.util.Collection;
import java.util.Map;

/**
 * @author: ly-wflei
 * @date: 2020/3/27
 * @version: 1.0
 */
public class StringUtils {

    public static Boolean IsEmptyO(Object obj) {
        if (obj == null) {
            return true;
        } else if ("".equals(obj)) {
            return true;
        } else {
            if (obj instanceof String) {
                if (((String)obj).length() == 0) {
                    return true;
                }
            } else if (obj instanceof Collection) {
                if (((Collection)obj).size() == 0) {
                    return true;
                }
            } else if (obj instanceof Map && ((Map)obj).size() == 0) {
                return true;
            }

            return false;
        }
    }

}