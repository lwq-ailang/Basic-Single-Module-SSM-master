package com.common.filler;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.filter.LevelFilter;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.spi.FilterReply;

/**
 * 日志过滤
 */
public class LinkinFilter extends LevelFilter {

    Level level;

    public FilterReply decide(ILoggingEvent event) {
        Level outLevel = event.getLevel();
        String message = event.getMessage();
        if(outLevel.equals(this.level)){
            if(message.contains("DUBBO") || message.contains("HandlerInterceptor.afterCompletion")
                    || message.contains("当前数据源key") || message.contains("Illegal DefaultValue")){
                return this.onMismatch;
            }else{
                return this.onMatch;
            }
        }
        return this.onMismatch;
    }

    public void setLevel(Level level) {
        this.level = level;
    }

    public void start() {
        if (this.level != null)
            super.start();
    }
}
