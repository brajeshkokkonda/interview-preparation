package com.mainmod;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Demo1 {
    public static void main(String[] args) {

        //System.out.println(hm);
        System.out.println(mostFreq("abracadabrra", 2));
    }
    
    public static List<Character> mostFreq(String input, int n) {
        Map<Character, Integer> freqMap = new HashMap<>();

        // Count frequency of each character
        for (char c: input.toCharArray()) {
            freqMap.put(c, freqMap.getOrDefault(c, 0) + 1);
        }

        // Sort by frequency (descending)
        List<Map.Entry<Character, Integer>> list = new ArrayList<>(freqMap.entrySet());
        list.sort((a, b) -> b.getValue().compareTo(a.getValue()));

        // Collect top N characters
        List<Character> result = new ArrayList<>();
        for (int i = 0; i < n && i < list.size(); i++) {
            result.add(list.get(i).getKey());
        }

        return result;
    }

}
