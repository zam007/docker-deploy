#!/bin/sh

a1=redis-store-comm-001.jjgkie.0001.cnn1.cache.amazonaws.com.cn
a2=redis-cache-comm-001.jjgkie.0001.cnn1.cache.amazonaws.com.cn
a4=redis-store-sync-001.jjgkie.0001.cnn1.cache.amazonaws.com.cn



echo ${a1}
(sleep 1; echo info;sleep 1)|telnet ${a1} 6379|grep used_memory_human
echo ${a2}
(sleep 1; echo info;sleep 1)|telnet ${a2} 6379|grep used_memory_human
echo ${a4}
(sleep 1; echo info;sleep 1)|telnet ${a4} 6379|grep used_memory_human
