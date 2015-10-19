select hid, count(hid) as c from qual group by hid order by c desc limit 10;
