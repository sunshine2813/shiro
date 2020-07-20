package com.sdhh.service;

import com.sdhh.po.Yytxxt;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ShebeiService {
    int addYytxxtShebei(Yytxxt p);
    int addCsxtShebei();
    int addDyxtShebei();
    int addJfhjShebei();
    int addJsjwlxtShebei();
    int addRjxtShebei();
    int addSphsxtShebei();
    int addWlaqxtShebei();
    int addXxcjxtShebei();
}
