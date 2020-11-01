package ru.itlab.models;

import java.util.Collections;
import java.util.Map;
import java.util.TreeMap;

public class Main {
    public static void main(String[] args) {
        TreeMap<Long, Float> map = new TreeMap<>(Long::compareTo);
        map.put(1L, 0.1f);
        map.put(2L, 0.3f);

        Map.Entry<Long, Float> maxEntry = Collections.max(map.entrySet(), Map.Entry.comparingByValue());
        System.out.println(maxEntry);
    }
}
