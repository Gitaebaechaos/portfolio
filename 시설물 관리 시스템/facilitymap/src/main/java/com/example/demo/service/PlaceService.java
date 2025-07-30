package com.example.demo.service;

import com.example.demo.entity.Place;
import com.example.demo.repository.PlaceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlaceService {

    @Autowired
    private PlaceRepository placeRepository;

    // 전체 시설물 조회
    public List<Place> findAll() {
        return placeRepository.findAll();
    }

    // 시설물 저장
    public Place save(Place place) {
        return placeRepository.save(place);
    }

    // 시설물 삭제
    public void delete(Long id) {
        placeRepository.deleteById(id);
    }
}