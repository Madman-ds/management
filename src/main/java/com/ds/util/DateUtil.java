package com.ds.util;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.security.InvalidParameterException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @类名称: DateUtil
 * @作者: 段大神经
 * @创建时间: 2018/9/27 22:39
 * @说明: 时间工具类
 */
public class DateUtil {

    /**
     * 记录日志对象
     */
    private final static Logger logger = LoggerFactory.getLogger(DateUtil.class);

    private static final String DATE = "yyyy-MM-dd";
    private static final String LOGGERINFO1 = "时间不能为空!";

    private static final long MILLISECONDS_PER_DAY = 24 * 60 * 60 * 1000L;


    /**
     * 每秒的毫秒数
     */
    public static final long MILLIS_PER_SECOND = 1000;
    /**
     * 每分钟的毫秒数
     */
    public static final long MILLIS_PER_MINUTE = 60 * MILLIS_PER_SECOND;
    /**
     * 每小时的毫秒数
     */
    public static final long MILLIS_PER_HOUR = 60 * MILLIS_PER_MINUTE;
    /**
     * 每天的毫秒数
     */
    public static final long MILLIS_PER_DAY = 24 * MILLIS_PER_HOUR;

    /**
     * 放置一批常用时间格式SimpleDateFormat
     */
    public static final Map<String, SimpleDateFormat> DATE_FORMAT_MAP;

    static {
        DATE_FORMAT_MAP = new HashMap<String, SimpleDateFormat>();
        DATE_FORMAT_MAP.put(DATE, new SimpleDateFormat(DATE));
        DATE_FORMAT_MAP.put("yyyy-MM-dd hh:mm:ss", new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"));
        DATE_FORMAT_MAP.put("yyyy/MM/dd", new SimpleDateFormat("yyyy/MM/dd"));
        DATE_FORMAT_MAP.put("yyyy/MM/dd hh:mm:ss", new SimpleDateFormat("yyyy/MM/dd hh:mm:ss"));
        DATE_FORMAT_MAP.put("yyyyMMdd", new SimpleDateFormat("yyyyMMdd"));
        DATE_FORMAT_MAP.put("yyyyMMddhhmmss", new SimpleDateFormat("yyyyMMddhhmmss"));
    }

    // 私有构造
    private DateUtil() {
    }

    public static Date now(){
        return new Date();
    }

    /**
     * 根据年月日构建日期对象。注意月份是从1开始计数的，即month为1代表1月份。
     *
     * @param year  年
     * @param month 月
     * @param day   日
     * @return 根据年月日构建日期对象
     */
    public static Date buildDate(int year, int month, int day) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(year, month - 1, day, 0, 0, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        return calendar.getTime();
    }

    /**
     * 判断两个日期是否同一天（忽略时间部分）
     *
     * @param date1 时间值1
     * @param date2 时间值2
     * @return 同一天返回true否则返回false
     */
    public static boolean isSameDay(Date date1, Date date2) {
        if (date1 == null || date2 == null) {
            throw new IllegalArgumentException("日期不能为空!");
        }
        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(date1);
        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(date2);
        return isSameDay(cal1, cal2);
    }

    /**
     * 判断两个日历是否是同一天
     *
     * @param cal1 日历值1
     * @param cal2 日历值2
     * @return 同一天返回true否则返回false
     */
    public static boolean isSameDay(Calendar cal1, Calendar cal2) {
        if (cal1 == null || cal2 == null) {
            throw new IllegalArgumentException(LOGGERINFO1);
        }
        return cal1.get(Calendar.ERA) == cal2.get(Calendar.ERA) && cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR)
                && cal1.get(Calendar.DAY_OF_YEAR) == cal2.get(Calendar.DAY_OF_YEAR);
    }

    /**
     * 计算开始日期和结束日期之间包含的天数
     *
     * @param start 开始日期
     * @param end   结束日期
     * @return 开始日期和结束日期之间包含的天数
     */
    public static int getStartToEndDayInterval(Date start, Date end) {
        // 时间非空判断
        if (start == null || end == null) {
            throw new InvalidParameterException("开始日期和结束日期不能为空!");
        }
        // 时间大小判断
        if (start.after(end)) {
            throw new InvalidParameterException("结束日期早于开始日期!");
        }
        // 计算开始日期和结束日期之间包含的天数
        return (int) ((end.getTime() - start.getTime()) / MILLIS_PER_DAY);
    }

    /**
     * 将时间转换成固定格式的时间字符串
     *
     * @param date          待转换的时间值
     * @param dateFormatStr 时间格式(可为空)
     * @return 固定格式的时间字符串
     */
    public static String dateToString(Date date, String dateFormatStr) {
        // 时间非空判断
        if (date == null) {
            throw new InvalidParameterException(LOGGERINFO1);
        }
        SimpleDateFormat dateFormat = null;
        // 获取时间格式对应的转换器
        if (dateFormatStr == null || "".equals(dateFormatStr)) {
            dateFormat = DATE_FORMAT_MAP.get(DATE);
        } else {
            dateFormat = DATE_FORMAT_MAP.get(dateFormatStr);
            // 当前时间格式内存中没有存在的时候实例化并存储起来为下次使用服务
            if (dateFormat == null) {
                dateFormat = new SimpleDateFormat(dateFormatStr);
                DATE_FORMAT_MAP.put(dateFormatStr, dateFormat);
            }
        }
        return dateFormat.format(date);
    }

    public static String dateTo8String(Date date) {
        return dateToString(date,"yyyyMMdd");
    }

    /**
     * 将时间格式的字符串转换成{@link Date}类型
     *
     * @param date          字符串时间
     * @param dateFormatStr 时间格式
     * @return 格式化之后的时间
     */
    public static Date stringToDate(String date, String dateFormatStr) {
        // 时间非空判断
        if (date == null || "".equals(date)) {
            throw new InvalidParameterException(LOGGERINFO1);
        }
        SimpleDateFormat dateFormat = null;
        // 获取时间格式对应的转换器
        if (dateFormatStr == null || "".equals(dateFormatStr)) {
            dateFormat = DATE_FORMAT_MAP.get(DATE);
        } else {
            dateFormat = DATE_FORMAT_MAP.get(dateFormatStr);
            // 当当前时间格式内存中没有存在的时候实例化并存储起来为下次使用服务
            if (dateFormat == null) {
                dateFormat = new SimpleDateFormat(dateFormatStr);
                DATE_FORMAT_MAP.put(dateFormatStr, dateFormat);
            }
        }
        try {
            return dateFormat.parse(date);
        } catch (ParseException e) {
            return null;
        }

    }

    /**
     * 开始日期和结束日期之间的所有日期
     *
     * @param startTime
     * @param endTime
     * @return
     */
    public static List<String> getAllDateBetween2Date(String startTime, String endTime) {
        List<String> dateList = new ArrayList<String>();
        try {
            Calendar startCalendar = Calendar.getInstance();
            Calendar endCalendar = Calendar.getInstance();
            SimpleDateFormat df = new SimpleDateFormat(DATE);
            Date startDate = df.parse(startTime);
            startCalendar.setTime(startDate);
            Date endDate = df.parse(endTime);
            endCalendar.setTime(endDate);
            dateList.add(startTime);
            while (true) {
                startCalendar.add(Calendar.DAY_OF_MONTH, 1);
                if (startCalendar.getTimeInMillis() < endCalendar.getTimeInMillis()) {
                    dateList.add(df.format(startCalendar.getTime()));
                    // System.out.println(df.format(startCalendar.getTime()));
                } else {
                    break;
                }
            }
            dateList.add(endTime);
        } catch (ParseException e) {
            logger.error("日期处理失败:" + e.getLocalizedMessage());
        }
        return dateList;
    }

    /**
     * 一个日期加days天
     *
     * @param startDate 原来的日期
     * @param days      天数
     * @return 处理后的日期yyyy-MM-dd
     */
    public static String addSomeDays(String startDate, int days) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            synchronized (sdf) {
                Date date = sdf.parse(startDate);
                Date nextDate = addSomeDays(date, days);
                return sdf.format(nextDate);
            }
        } catch (ParseException e) {
            logger.error(LOGGERINFO1 + e.getLocalizedMessage());
            return null;
        }
    }

    /**
     * 一个日期加days天
     *
     * @param startDate 原来的日期
     * @param days      天数
     * @return 处理后的日期yyyy-MM-dd
     */
    public static Date addSomeDays(Date startDate, int days) {
        return new Date(startDate.getTime() + days * MILLISECONDS_PER_DAY);
    }

    /**
     * 昨天
     * @return
     */
    public static Date getYesterday(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        synchronized (sdf) {
            date = new Date(date.getTime() - 24 * 60 * 60 * 1000L);
        }
        return date;
    }

    /**
     * 两个时间相差距离多少天多少小时多少分多少秒
     * @param startTime
     * @param endTime
     * @return long[] 返回值为：{天, 时, 分, 秒}
     */
    public static long[] getDistanceTimes(Date startTime, Date endTime) {
        long day = 0;
        long hour = 0;
        long min = 0;
        long sec = 0;
        long time1 = startTime.getTime();
        long time2 = endTime.getTime();
        long diff ;
        if(time1<time2) {
            diff = time2 - time1;
        } else {
            diff = time1 - time2;
        }
        day = diff / (24 * 60 * 60 * 1000);
        hour = (diff / (60 * 60 * 1000) - day * 24);
        min = ((diff / (60 * 1000)) - day * 24 * 60 - hour * 60);
        sec = (diff/1000-day*24*60*60-hour*60*60-min*60);
        long[] times = {day, hour, min, sec};
        return times;
    }
}
